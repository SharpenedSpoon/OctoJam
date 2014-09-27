# Octo-ber Jam Meteor Webapp
###### Author: [Ian Douglas](http://subfacet.com/)

This is a [Meteor](https://www.meteor.com/) webapp created for the Octo-ber Jam, but also designed to also act as a generic webapp to facilitate any ol' game jam.

Octo is a compiler and emulator for Chip8, and you can read more about it (and try it out) [here](https://github.com/JohnEarnest/Octo)!

## Features
* User accounts
	* Registered users can submit and/or vote on games
	* Non-registered users can view and play games (a random sampling of games will be shown)
	* Users can register using:
		* A simple username/password combo
		* Facebook (maybe)
		* Twitter (maybe)
		* Other comedy options: Google, Gtihub, Meetup, Steam
* Games
	* Submitted by registered users
	* Contain a title, description, and link
	* For the Octo-ber Jam, the game will also be displayed as an iframe embed
	* Perhaps will also allow for screenshot uploading (mostly because I want to figure out how to do this in Meteor!)
	* The user owner can edit their game in the details view
	* Other registered users can vote on a game (or games) that they like, once the voting period starts
* Admin Dashboard
	* Very simple!
	* Show votes before the voting phase is over
	* Setting the submission start and end dates, and the voting start and end dates
* Pages
	* Show some pages. Not a CMS though.

## Packages Used
* accounts-base
* accounts-password
* accounts-ui
* coffeescript
* iron:layout
* mizzao:bootstrap-3
* fourseven:scss
