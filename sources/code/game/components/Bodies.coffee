module "Bodies", [ "Vec2" ], ( m ) ->
	module =
		createBody: () ->
			body =
				position    : [ 0, 0 ]
				velocity    : [ 0, -100 ]

		updateBodies: ( frameTimeInS, bodies ) ->
			for entityId, body of bodies
				frameMovement = m.Vec2.copy( body.velocity )
				m.Vec2.scale( frameMovement, frameTimeInS )

				m.Vec2.add( body.position, frameMovement )
