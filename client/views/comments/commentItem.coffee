Template.commentItem.canEdit = () ->
	canEdit = false
	currentUser = Meteor.userId()
	if currentUser
		# comment author and game author can edit comments
		if @owner == currentUser
			canEdit = true
		else
			game = Games.findOne({_id: @gameId})
			canEdit = (game.owner == currentUser) if game
	return canEdit


Template.commentItem.events {
	'click #removeComment': (e, t) ->
		e.preventDefault()
		if confirm("Are you sure you want to delete this comment?")
			Comments.remove(t.data._id)
}
