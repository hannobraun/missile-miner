module "DetectCollisions", [ "Vec2" ], ( m ) ->
	module =
		( minerControls, asteroids, bodies ) ->
			for minerId, minerControl of minerControls
				minerBody = bodies[ minerId ]

				for asteroidId, asteroid of asteroids
					asteroidBody = bodies[ asteroidId ]

					minerToAsteroid = m.Vec2.copy( asteroidBody.position )
					m.Vec2.subtract( minerToAsteroid, minerBody.position )

					radii = minerBody.radius + asteroidBody.radius
					if m.Vec2.length( minerToAsteroid ) < radii
						minerControl.health -= 1
