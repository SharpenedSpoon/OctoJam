Template.gameList.helpers {

	games: () ->
		return Games.find().map (game) ->
			game.author = 'A G-g-g-ghost!'
			author = Meteor.users.findOne(game.userId)
			game.author = author.username if author
			return game

}
