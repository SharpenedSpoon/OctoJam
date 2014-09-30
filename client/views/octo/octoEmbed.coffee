Template.octoEmbed.helpers {
	scale: () -> if @.scale then @.scale else 2

	width: () -> if @.scale then parseInt(@.scale) * 128 else 2 * 128

	height: () -> if @.scale then parseInt(@.scale) * 64 else 2 * 64

	link: () ->
		if @.link == false || @.link == 'false' || @.link == '0' || @.link == 0
			return false
		else
			return true
}
