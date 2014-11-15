Meteor.publish 'games', () ->
	games = Games.find()
	userIds = []
	games.forEach (game) ->
		userIds.push game.owner
	users = Meteor.users.find { _id: {$in: userIds} }, { fields: {_id: 1, profile: 1} }
	return [games, users]



Meteor.publish 'comments', () ->
	comments = Comments.find()
	userIds = []
	comments.forEach (comment) ->
		userIds.push comment.owner
	users = Meteor.users.find { _id: {$in: userIds} }, { fields: {_id: 1, profile: 1} }
	return [comments, users]

Meteor.publish 'votes', () ->
	# return Votes.find({owner: this.userId})
	return Votes.find()
