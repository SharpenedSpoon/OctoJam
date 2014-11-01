#
# Games related hooks
#
Meteor.subscribe('games')

AutoForm.hooks({
	insertGame: {
		onSuccess: (operation, result, template) ->
			Router.go('/game/' + result)

	}

	updateGame: {
		onSuccess: (operation, result, template) ->
			if template.data.doc._id
				Router.go('/game/' + template.data.doc._id)
			else
				Router.go('/')
	}
});



#
# Comments related
#
Meteor.subscribe('comments')


Meteor.subscribe 'votes'
