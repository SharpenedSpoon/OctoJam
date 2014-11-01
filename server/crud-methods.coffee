Meteor.methods {
	castVote: (gameId, userId) ->
		check(userId, String)
		check(gameId, String)

		# make sure game and user exists
		votes = Votes.findOne({owner: userId})
		# if (! votes)
		# 	throw new Meteor.Error 'cant-vote-for-nonuser', 'Can\'t find votes for user'
		if (! votes)
			votes = {
				owner: userId
				votes: []
			}

		# you can't vote on a game twice, sucka.
		if _.indexOf(votes.votes, gameId) != -1
			throw new Meteor.Error 'cant-vote-twice', 'Can\'t vote for same game twice'

		votes.votes.push gameId
		Votes.upsert({owner: userId}, votes)
}
