# see https://github.com/EventedMind/iron-router/blob/devel/DOCS.md#route-paths-and-parameters


# Defaults for the router
Router.configure
	layoutTemplate: 'layout'
	notFoundTemplate: 'notFound'
	loadingTemplate: 'loading'
	yieldTemplates:
		'header': { to: 'headerRegion' }
		'footer': { to: 'footerRegion' }


# Routes for each page
Router.map () ->

	# Home Page
	@route 'home', { path: '/' }
