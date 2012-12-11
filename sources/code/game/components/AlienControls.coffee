module "AlienControls", [], ( m ) ->
	module =
		createAlienControl: ( initialPosition ) ->
			alienControl =
				waypoint: initialPosition

				tubeDelay: 10

				tubeACooldown: 2
				tubeBCooldown: 1.5
