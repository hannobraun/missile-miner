module "AddScore", [], ( m ) ->
	module =
		( frameTimeInS, minerControls, gameState ) ->
			for entityId, minerControl of minerControls
				laserEfficiency = minerControl.laserEfficiency

				scoreBaseValue = 100
				scorePerS      =
					scoreBaseValue * laserEfficiency*laserEfficiency

				gameState.score += frameTimeInS * scorePerS
