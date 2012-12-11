module "Asteroids", [ "AsteroidControls", "Bodies" ], ( m ) ->
	nextEntityId = 0

	module =
		createAsteroid: ( args ) ->
			asteroidControl = m.AsteroidControls.createAsteroidControl()

			body = m.Bodies.createBody()
			body.position = [ Math.random() * args.fieldSize[ 0 ], args.fieldSize[ 1 ] / 2 ]
			body.velocity = [ Math.random() * 100 - 50, Math.random() * 100 - 50 ]
			body.radius   = asteroidControl.initialRadius

			id = "asteroid#{ nextEntityId }"
			nextEntityId += 1

			entity =
				id: id
				components:
					"bodies"          : body
					"asteroidControls": asteroidControl
					"imageIds"        : "asteroid.png"
