Template.octoEmbed.helpers {
	scale: () -> if @.scale then @.scale else 2

	width: () ->
		if @.width
			return @.width
		else
			width = 2 * 128
			if @.scale
				width = parseInt(@.scale) * 128
			if @.padding
				width += parseInt(@.padding)
			return width

	height: () ->
		if @.height
			return @.height
		else
			height = 2 * 64
			if @.scale
				height = parseInt(@.scale) * 64
			if @.padding
				height += parseInt(@.padding)
			return height

	link: () ->
		if @.link == false || @.link == 'false' || @.link == '0' || @.link == 0
			return false
		else
			return true
}


Template.octoEmbed.events {
	'click .js-toggle-full-screen': (e, t) ->
		e.preventDefault()
		t.$('.octo-embed-container').toggleClass('full-screen')
}
