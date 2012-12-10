module "MinerControls", [ "Input" ], ( m ) ->
	module =
		createMinerControl: () ->
			{}

		processInput: ( currentInput, frameTimeInS, minerControls, bodies ) ->
			for entityId, minerControl of minerControls
				body = bodies[ entityId ]

				if m.Input.isKeyDown( currentInput, "up arrow" )
					body.velocity = [ 0, -200 ]
				else
					body.velocity = [ 0, 0 ]

				rotationDirection = 0
				if m.Input.isKeyDown( currentInput, "right arrow" )
					rotationDirection = 1
				if m.Input.isKeyDown( currentInput, "left arrow" )
					rotationDirection = -1

				rotationInRadPerS = 4
				body.orientation +=
					rotationInRadPerS * frameTimeInS * rotationDirection
