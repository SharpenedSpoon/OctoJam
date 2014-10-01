Template.gameDetails.helpers {
	description: () ->
		if @.description
			return stripTagsAndAutoP(@.description)
		else
			return 'No Description'

	canEdit: () ->
		return Meteor.userId() == @.owner
}
