Meteor.publish 'games', () ->
	games = Games.find()
	userIds = []
	games.forEach (game) ->
		userIds.push game.owner
	users = Meteor.users.find { _id: {$in: userIds} }, { fields: {_id: 1, profile: 1} }
	return [games, users]

###
Meteor.publish 'userProfiles', () ->
	if this.userId
		return Meteor.users.find {}, { fields: {'_id': 1, 'things'} }
###

Meteor.publish 'comments', () ->
	return Comments.find()
