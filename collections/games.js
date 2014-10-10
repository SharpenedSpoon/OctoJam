/*
 * This is a .js file (instead of .coffee) because it's easier/more obvious
 * how to do "global" variables that can then be accessed in coffescript
 * files when you do javascript.
 */





/*
Games
    Schema version 1
        title       (string)
        embedId     (string) (/Octo/embed.html?scale=2&gist=________)
        status      (string)
        description (string)
        [owner]       (string) (user._id)
        [createdAt] (Date)
        [updatedAt] (Date)
*/

Games = new Mongo.Collection('games');


// see https://github.com/aldeed/meteor-autoform
Games.attachSchema(new SimpleSchema({
    title: {
        type: String,
        label: 'Game Name',
        max: 200,
    },
    embedId: {
        type: String,
        label: 'Gist ID',
        max: 100,
    },
    description: {
        type: String,
        label: 'Description',
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
    active: {
        type: Boolean,
        label: 'Active',
        autoValue: function() {
            if (! this.isSet) {
                this.value = true;
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
    // author: {
    //     type: String,
    //     autoform: {
    //         omit: true
    //     },
    //     autoValue: function() {
    //         return Meteor.user().emails[0].address.replace(/@.*/, '')
    //     }
    // }
}));


Games.allow({
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
