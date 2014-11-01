/*
Votes
	Schema version 1
		owner       (string)
		votes		(array of gameIds)
*/
Votes = new Mongo.Collection('votes');


Games.allow({
	insert: function(userId, doc) {
		// user must be logged in, and doc must be owned by user
		return false;
	},

	update: function(userId, doc) {
		// user must be logged in, and doc must be owned by user
		return false;
	},

	remove: function(userId, doc) {
		// user must be logged in, and doc must be owned by user
		return false;
	}
});
