module "AlienControls", [], ( m ) ->
	module =
		createAlienControl: ( initialPosition ) ->
			alienControl =
				waypoint: initialPosition
