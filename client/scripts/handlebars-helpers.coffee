
# Helper for the navigation, to see if a given page is active and return an "active" class
# see https://coderwall.com/p/ahlrua
Handlebars.registerHelper 'active', (path) ->
	return (if path == Router.current().path then 'active' else '')
