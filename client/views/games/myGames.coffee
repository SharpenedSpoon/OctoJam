Template.myGames.helpers {
	hasGames: () ->
		return Games.findOne({owner: Meteor.userId()}) != undefined

	games: () ->
		return Games.find({owner: Meteor.userId()}).map (game) ->
			game.activeState = if game.active then 'Active' else 'Inactive'
			return game
}
