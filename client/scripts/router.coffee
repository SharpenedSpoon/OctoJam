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
	@route 'home', { path: '/', layoutTemplate: 'homepageLayout' }

	# 'All Games' Page
	@route 'games', { path: '/games' }

	# User Account Page
	# @route 'myAccount', { path: '/me' }
	@route 'myGames', { path: '/me' }

	# Static Content Pages
	# @route 'faq', { path: '/faq' }
	# @route 'chip8Overview', { path: '/chip8-overview' }
	# @route 'rules', { path: '/rules' }
	# @route 'bootstrap', { path: '/bootstrap' }

	# Submit a game page
	@route 'newGame', { path: '/submit-game' }

	# Edit a game page
	@route 'editGame',
		data: ->
			return Games.findOne(@params._id)

		onBeforeAction: ->
			game = @data()

		path: '/edit-game/:_id'

		waitOn: ->
			return Meteor.subscribe('games', @params._id)


	# Game Details Pages
	@route 'gameDetails',
		data: ->
			return Games.findOne(@params._id)

		onBeforeAction: ->
			game = @data()

		path: '/game/:_id'

		layoutTemplate: 'gameDetailsLayout'

		waitOn: ->
			return Meteor.subscribe('games', @params._id)
