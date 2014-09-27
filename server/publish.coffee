Meteor.publish 'games', () ->
	return Games.find()
