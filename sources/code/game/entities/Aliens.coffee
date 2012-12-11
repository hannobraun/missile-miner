module "Aliens", [ "AlienControls", "Bodies" ], ( m ) ->
	nextEntityId = 0

	module =
		createAlien: ( args ) ->
			x = args.fieldSize[ 0 ] / 2 + Math.random() * 100 - 50
			y = Math.random() * args.fieldSize[ 1 ] - args.fieldSize[ 1 ] / 2

			body = m.Bodies.createBody()
			body.position = [ x, y ]
			body.radius   = 5

			id = "alien#{ nextEntityId }"
			nextEntityId += 1

			entity =
				id: id
				components:
					"bodies"       : body
					"alienControls": m.AlienControls.createAlienControl()
					"imageIds"     : "alien.png"