###

Populate the database with some sample data if there is none already

###




# iandouglas@gmail: qjgRNwijPGED9mgn3
# iandouglas@nuancedmedia: o9FDxrM9J5McDgCQH


Meteor.startup () ->
	#populateSampleData()

populateSampleData = () ->
	if (! Games.findOne() && false)
		Games.insert {
			title: 'Cave Explorer'
			embedId: 'a833793082d98eaa905d'
			status: 'active'
			userId: 'qjgRNwijPGED9mgn3'
			description: 'No Description'
		}

		Games.insert {
			title: 'Chipenstein 3D'
			embedId: 'e171ad3a2c2385ae11ea'
			status: 'active'
			userId: 'qjgRNwijPGED9mgn3'
			description: 'A work-in-progress experiment in creating a raycast 2.5d shooter'
		}

		Games.insert {
			title: 'ChipWar'
			embedId: 'b819b801dd338a198dda'
			status: 'active'
			userId: 'o9FDxrM9J5McDgCQH'
			description: 'War. War never changes. This game takes place on a toroidal field of 16 territories. Each has some number of troops stationed there (1-5). at the beginning of the game, territories are divided between you (white) and an AI opponent (black).

	You can order your territories to attack adjacent enemy territories provided you have more than one troop available. When you attack, a number of 8-sided dice will be rolled and summed based on the number of attackers and defenders. If the attackers win, they capture the territory and transfer all but one of their troops over. If the defenders win, they destroy all but one of the attackers and lose one troop, or none if they have only a single troop.

	After white has taken a turn, each territory has a 50% chance of producing one new troop. The game ends when black or white has conquered the entire map.

	When selecting a territory, ASWD move your cursor, E selects the territory and Q ends your turn. With a territory selected, ASWD choose the direction in which to attack, E confirms the attack and Q cancels. When the game is over press any key to play again.

	Based loosely on the Flash game DiceWars:

	http://www.gamedesign.jp/flash/dice/dice.html'
		}

		Games.insert {
			title: 'Cave Explorer 2'
			embedId: 'e171ad3a2c2385ae11ea'
			status: 'active'
			userId: 'qjgRNwijPGED9mgn3'
			description: 'No Description, still.'
		}

		Games.insert {
			title: 'Smile 2'
			embedId: '080ccbf4d01bba5affcb'
			status: 'active'
			userId: 'qjgRNwijPGED9mgn3'
			description: 'A very simple example program which draws smiley faces on the screen randomly and periodically clears the display.'
		}

		Games.insert {
			title: 'Outlaw'
			embedId: '9ab5111fe8ee37c52088'
			status: 'active'
			userId: 'o9FDxrM9J5McDgCQH'
			description: 'An adaptation of the Atari 2600 game "Outlaw" for the Chip8.

	Move with ASWD and fire with E. Holding a direction while firing will fire an angled shot, which ricochets.'
		}

		Games.insert {
			title: 'Smile'
			embedId: '080ccbf4d01bba5affcb'
			status: 'active'
			userId: 'qjgRNwijPGED9mgn3'
			description: 'A very simple example program which draws smiley faces on the screen randomly and periodically clears the display.'
		}

		Games.insert {
			title: 'Sw8 Copter'
			embedId: 'b4a78479030e68f241a2'
			status: 'active'
			userId: 'qjgRNwijPGED9mgn3'
			description: 'An adaptation of "Swing Copters" for the Super Chip8.

	Press E to start a game and then press E to switch directions. Avoid obstacles!'
		}
