/*
 * This is a .js file (instead of .coffee) because it's easier/more obvious
 * how to do "global" variables that can then be accessed in coffescript
 * files when you do javascript.
 */


// using a bunch of these: https://atmospherejs.com/sewdn/collection-behaviours
// ... they're so helpful!!



/*
Games
    Schema version 1
        title       (string)
        embedId     (string) (/Octo/embed.html?scale=2&gist=________)
        status      (string)
        owner       (string) (user._id)
        description (string)
        [createdAt] (automatic)
        [updatedAt] (automatic)
        [gameId]    (automatic)
*/
Meteor.startup(function() {
    // AutoForm.debug();
});
Games = new Mongo.Collection('games');
// Games.timestampable();
// Games.autoIncrementable('gameId');
// Games.softRemovable();
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
    }
}));

Games.allow({
    insert: function(userId, doc) {
        // user must be logged in, and doc must be owned by user
        console.log(userId);
        console.log(doc);
        console.log(doc.owner);
        // return (userId && doc.owner === userId);
        return true;
    }
})
