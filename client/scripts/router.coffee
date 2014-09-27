# see https://github.com/EventedMind/iron-router/blob/devel/Guide.md


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

	# 'All Games' Page
	@route 'games', { path: '/games' }

	# User Account Page
	@route 'myAccount', { path: '/me' }

	# Game Details Pages
	@route 'gameDetails',
		data: ->
			return Games.findOne(@params._id)

		onBeforeAction: ->
			game = @data()

		path: '/game/:_id'

		waitOn: ->
			return Meteor.subscribe('games', @params._id)
