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
		label: 'Comment',
		max: 1000,
		autoform: {
			rows: 10
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
			console.log(this);
			return this.userId;
		}
	},
	/*gameId: {
		type: String,
		autoform: {
			omit: true
		},
		autoValue: function() {
			console.log(this);
			return this.value;
		}
	}*/
}));


Comments.allow({
	insert: function(userId, doc) {
		// user must be logged in, and doc must be owned by user
		return (userId && doc.owner === userId);
	},

	update: function(userId, doc) {
		// user must be logged in, and doc must be owned by user
		return (userId && doc.owner === userId);
	},

	remove: function(userId, doc) {
		// user must be logged in, and doc must be owned by user
		return (userId && doc.owner === userId);
	}
});
