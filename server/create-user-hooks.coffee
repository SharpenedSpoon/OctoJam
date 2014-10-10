Accounts.onCreateUser (options, user) ->
	username = user.emails[0].address.replace(/(.*)@.*/, "$1").replace(/[^A-Za-z]/g, '')
	#user.username = username
	user.profile = if options.profile then options.profile else {}
	user.profile.displayName = username
	return user
