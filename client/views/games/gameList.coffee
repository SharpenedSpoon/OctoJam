Template.gameList.helpers {

	games: (arg) ->
		console.log arg
		return Games.find().map (game) ->
			author = Meteor.users.findOne(game.userId)
			#game.author = author.emails[0].address || 'A Ghost'
			return game

}
