module "RemoveOre", [], ( m ) ->
	module =
		( frameTimeInS, minerControls, asteroidControls, bodies ) ->
			for entityId, minerControl of minerControls
				laserEfficiency = minerControl.laserEfficiency

				if laserEfficiency > 0
					asteroidId = minerControl.nearestAsteroidId

					asteroidBody    = bodies[ asteroidId ]
					asteroidControl = asteroidControls[ asteroidId ]

					baseHarvest    = 100
					removedOrePerS =
						baseHarvest * laserEfficiency*laserEfficiency

					asteroidControl.currentOre -= removedOrePerS * frameTimeInS
					asteroidBody.radius =
						asteroidControl.initialRadius * ( asteroidControl.currentOre / asteroidControl.initialOre )
