Template.gameDetails.helpers {
	description: () ->
		if @.description
			return stripTagsAndAutoP(@.description)
		else
			return 'No Description'

	canEdit: () ->
		return Meteor.userId() == @.owner


	authorDisplayName: () ->
		user = Meteor.users.findOne({ _id: @.owner })
		name = ""
		if user
			name = if user.profile.displayName then user.profile.displayName else user.username
			name = "By " + name
		return name

}
