module "MinerControls", [ "Input" ], ( m ) ->
	module =
		createMinerControl: () ->
			minerControl =
				health: 3

		processInput: ( currentInput, frameTimeInS, minerControls, bodies ) ->
			for entityId, minerControl of minerControls
				body = bodies[ entityId ]

				body.accelerationMagnitude =
					if m.Input.isKeyDown( currentInput, "up arrow" )
						200
					else
						0

				rotationDirection = 0
				if m.Input.isKeyDown( currentInput, "right arrow" )
					rotationDirection = 1
				if m.Input.isKeyDown( currentInput, "left arrow" )
					rotationDirection = -1

				rotationInRadPerS = 4
				body.orientation +=
					rotationInRadPerS * frameTimeInS * rotationDirection
