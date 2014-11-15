Template.castVote.events {
	'click .js-cast-vote': (e) ->
		e.preventDefault()
		Meteor.call 'castVote', @_id, Meteor.userId(), (error, result) ->
			console.log error
			console.log result
}


Template.castVote.helpers {
	canVote: () ->
		
		return false; # voting is now closed!!

		# if (! Meteor.userId())
		# 	return false
		#
		# vote = Votes.findOne({owner: Meteor.userId()})
		# # console.log vote
		#
		# if (! vote)
		# 	return true
		# else
		# 	if (_.indexOf(vote.votes, @_id) == -1)
		# 		return true
		# 	else
		# 		return false
}
