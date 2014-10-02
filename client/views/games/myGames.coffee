Template.myGames.helpers {
	hasGames: () ->
		return Games.findOne({owner: Meteor.userId()}) != undefined

	games: () ->
		return Games.find({owner: Meteor.userId()}).map (game) ->
			game.activeState = if game.active then 'Active' else 'Inactive'
			return game

	userDisplayName: () ->
		name = ""
		user = Meteor.users.findOne(Meteor.userId())
		if user
			name = if (user.profile && user.profile.displayName) then user.profile.displayName else user.username
		return name
}


Template.myGames.events {
	'click #updateDisplayName': (e, t) ->
		newName = t.find('#newDisplayName').value
		if newName && newName != ''
			user = Meteor.users.findOne({ _id: Meteor.userId() })
			if user
				newProfile = user.profile
				newProfile.displayName = newName
				Meteor.users.update({_id: Meteor.userId()}, {$set: {profile: newProfile}})
}
