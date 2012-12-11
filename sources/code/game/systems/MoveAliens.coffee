module "MoveAliens", [], ( m ) ->
	( frameTimeInS, alienControls, bodies ) ->
		for entityId, alienControl of alienControls
			body = bodies[ entityId ]

			angularMomentumPerS = 0.5
			body.orientation += angularMomentumPerS * frameTimeInS