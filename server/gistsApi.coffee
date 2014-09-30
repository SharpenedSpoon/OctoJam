# using this as a guide
# https://github.com/awatson1978/rest-api/blob/master/server/server.api.js

Router.map () ->
	this.route 'gists',
		path: '/gists/:id'
		where: 'server'
		action: () ->
			this.response.statusCode = 200
			this.response.setHeader "Content-Type", "application/json"
			this.response.setHeader "Access-Control-Allow-Origin", "*"
			this.response.setHeader "Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept"

			if this.request.method == 'GET'

				# try to find the stored gist
				gist = Gists.findOne { gistId: this.params.id }

				if ! gist
					# couldn't find the gist, so we have to grab it and store it
					console.log 'New gist requested with id ' + this.params.id
					gist = Meteor.http.call 'GET', 'https://api.github.com/gists/' + this.params.id,
						headers:
							'User-Agent': 'OctoJam'
					gist = JSON.stringify(gist.data)
					Gists.insert({ gistId: this.params.id, content: gist })
					this.response.end gist
				else
					# found the cached gist, return it
					this.response.end gist.content
			else
				this.response.end 'Error. Can\'t do that.'
