
# Helper for the navigation, to see if a given page is active and return an "active" class
# see https://coderwall.com/p/ahlrua
Handlebars.registerHelper 'active', (path) ->
	return (if path == Router.current().path then 'active' else '')
Handlebars.registerHelper 'isActive', (path) ->
	return (path == Router.current().path)


# Tries to figure out and set the current page title
currentPageTitle = () ->
	title = 'Page Title'
	return 'Octo-ber Jam 2014' + ' | ' + title

Handlebars.registerHelper 'setPageTitle', () ->
	document.title = currentPageTitle()

Meteor.startup () ->
	Games.helpers {
		author: () ->
			user = ''
			user = Meteor.users.findOne(this.userId)
			if user
				if user.profile.displayName
					user = user.profile.displayName
				else
					user = user.username
			return user
	}
