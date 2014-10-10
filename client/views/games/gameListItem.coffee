Template.gameListItem.authorDisplayName = () ->

	user = Meteor.users.findOne({ _id: @.owner })
	name = ""
	if user
		name = if user.profile.displayName then user.profile.displayName else user.username
	return name


Template.gameListItem.commentCount = () ->
	return Comments.find({gameId: @._id}).fetch().length
