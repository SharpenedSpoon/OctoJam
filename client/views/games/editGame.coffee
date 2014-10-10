# see https://github.com/aldeed/meteor-autoform#a-basic-update-form

Template.editGame.helpers {
	shouldDisplay: () ->
		return @.owner == Meteor.userId()

	editingDoc: editingDocHelper = () ->
		return Games.findOne({_id: @._id})
}
