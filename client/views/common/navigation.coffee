Template.navigation.navItems = () ->
	currentPath = Router.current().path || ''
	return [
		{
			title: 'Home'
			path: '/'
			activeClass: (if currentPath == '/' then 'active' else '')
		}
		{
			title: 'Games'
			path: '/games'
			activeClass: (if currentPath == '/games' then 'active' else '')
		}
	]
