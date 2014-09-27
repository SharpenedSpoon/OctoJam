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
        userId      (string) (user._id)
        description (string)
        [createdAt] (automatic)
        [updatedAt] (automatic)
        [gameId]    (automatic)
*/
Games = new Meteor.Collection('games');
Games.timestampable();
Games.autoIncrementable('gameId');
Games.softRemovable();
