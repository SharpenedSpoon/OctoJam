Accounts.onCreateUser (options, user) ->
	user.username = user.emails[0].address.replace(/(.*)@.*/, "$1").replace(/[^A-Za-z]/g, '')
	user.profile = options.profile if options.profile
	return user
