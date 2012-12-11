module "DetectCollisions", [ "Vec2" ], ( m ) ->
	module =
		( minerControls, asteroids, bodies ) ->
			for minerId, minerControl of minerControls
				minerBody = bodies[ minerId ]

				nearestDistance = Number.MAX_VALUE

				for asteroidId, asteroid of asteroids
					asteroidBody = bodies[ asteroidId ]

					minerToAsteroid = m.Vec2.copy( asteroidBody.position )
					m.Vec2.subtract( minerToAsteroid, minerBody.position )

					distance = m.Vec2.length( minerToAsteroid )
					radii    = minerBody.radius + asteroidBody.radius
					if distance < radii
						minerControl.health -= 1

					if distance < nearestDistance
						nearestDistance                = distance
						minerControl.nearestAsteroidId = asteroidId
