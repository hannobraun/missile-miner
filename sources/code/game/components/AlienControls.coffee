module "AlienControls", [], ( m ) ->
	module =
		createAlienControl: ( initialPosition ) ->
			alienControl =
				waypoint: initialPosition

				tubeDelay: 10

				tubeACooldown: 10
				tubeBCooldown: 9.75
