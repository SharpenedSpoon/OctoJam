Template.comments.helpers {
	comments: () ->
		return Comments.find({gameId: @._id}).map (comment) ->
			comment.author = ''
			user = Meteor.users.findOne({_id: comment.owner})
			comment.author = user.profile.displayName if user

			comment.content = stripTagsAndAutoP(comment.content)

			comment.timeago = moment(comment.createdAt).fromNow()
			return comment
}
