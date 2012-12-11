module "ActivateMiningLaser", [ "Vec2" ], ( m ) ->
	module =
		( minerControls, bodies ) ->
			for entityId, minerControl of minerControls
				unless minerControl.nearestAsteroidId == null
					minerBody    = bodies[ entityId ]
					asteroidBody = bodies[ minerControl.nearestAsteroidId ]

					minerToAsteroid = m.Vec2.copy( asteroidBody.position )
					m.Vec2.subtract( minerToAsteroid, minerBody.position )

					maxDistance = 100
					distance    = m.Vec2.length( minerToAsteroid )
					minerControl.laserEfficiency =
						if distance <= maxDistance
							1 - distance * ( 1 / maxDistance )
						else
							0
