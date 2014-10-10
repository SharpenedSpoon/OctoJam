/*
Games
	Schema version 1
		content     (string)
		[owner]     (string) (user._id)
		[gameId]    (string)
		[createdAt] (Date)
		[updatedAt] (Date)
		[status]    (bool)

*/
Comments = new Mongo.Collection('comments');


// see https://github.com/aldeed/meteor-autoform
Comments.attachSchema(new SimpleSchema({
	content: {
		type: String,
		label: 'Leave a Comment',
		max: 1000,
		autoform: {
			rows: 5
		},
		autoValue: function() {
			if (this.isSet) {
				// strip tags and (almost) auto-p.
				this.value = this.value
					.replace(/<[^>]*>/gm, '') // kill any tags
					.replace(/\t/g, '') // remove "\t"s
					.replace(/^\s+$/gm, '') // change lines that are just "\s"s to just line breaks
					.replace(/(?:^ +| +$)/gm, '') // trim each line
					.replace(/(\n\r?\n\r?)(?:\n\r?)+/g, "$1") // replace > 2 line breaks to just 2 line breaks
			}
			return this.value;
		}
	},

	// automatic/forced stuff
	createdAt: {
		type: Date,
		autoform: {
			omit: true
		},
		autoValue: function() {
			if (this.isInsert) {
				return new Date();
			} else if (this.isUpsert) {
				return {$setOnInsert: new Date};
			} else {
				this.unset();
			}
		}
	},
	updatedAt: {
		type: Date,
		autoform: {
			omit: true
		},
		autoValue: function() {
			if (this.isUpdate) {
				return new Date();
			}
		},
		denyInsert: true,
		optional: true
	},
	owner: {
		type: String,
		autoform: {
			omit: true
		},
		autoValue: function() {
			return this.userId;
		}
	},
	gameId: {
		type: String,
		autoform: {
			omit: true
		},
		autoValue: function() {
			return this.value;
		}
	}
}));


Comments.allow({
	insert: function(userId, doc) {
		// user must be logged in, and doc must be owned by user
		return (userId && doc.owner === userId && Games.findOne(doc.gameId));
	},

	remove: function(userId, doc) {
		var canEdit = false;
		if (userId) {
			// comment author and game author can edit comments
			if (doc.owner == userId) {
				canEdit = true;
			} else {
				var game = Games.findOne({_id: doc.gameId});
				if (game) {
					canEdit = (game.owner == userId);
				}
			}
		}
		return canEdit;
	}
});
