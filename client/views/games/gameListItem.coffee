Template.gameListItem.helpers {
	authorDisplayName: () ->
		user = Meteor.users.findOne({ _id: @.owner })
		name = ""
		if user
			name = if user.profile.displayName then user.profile.displayName else user.username
		return name

	commentCount: () ->
		return Comments.find({gameId: @._id}).fetch().length

	votes: () ->
		return Votes.find({votes: @._id}).count()
}
