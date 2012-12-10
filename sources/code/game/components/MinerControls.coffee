module "MinerControls", [ "Input" ], ( m ) ->
	module =
		createMinerControl: () ->
			{}

		processInput: ( currentInput, minerControls, bodies ) ->
			for entityId, minerControl of minerControls
				body = bodies[ entityId ]

				if m.Input.isKeyDown( currentInput, "up arrow" )
					body.velocity = [ 0, -100 ]
				else
					body.velocity = [ 0, 0 ]
