
# Helper for the navigation, to see if a given page is active and return an "active" class
# see https://coderwall.com/p/ahlrua
Handlebars.registerHelper 'active', (path) ->
	return (if path == Router.current().path then 'active' else '')
Handlebars.registerHelper 'isActive', (path) ->
	return (path == Router.current().path)


# Tries to figure out the current page title
Handlebars.registerHelper 'pageTitle', () ->
	return 'Page Title'


Meteor.startup () ->
	Games.helpers {
		author: () ->
			user = 'A G-g-g-ghost!'
			user = Meteor.users.findOne(this.userId)
			user = user.username if user
			return user
	}
