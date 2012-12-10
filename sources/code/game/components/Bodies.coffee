module "Bodies", [ "Vec2", "Transform2d" ], ( m ) ->
	module =
		createBody: () ->
			body =
				position: [ 0, 0 ]
				velocity: [ 0, 0 ]

				orientation: 0

				accelerationMagnitude: 0

		updateBodies: ( frameTimeInS, bodies ) ->
			for entityId, body of bodies
				orientationTransform =
					m.Transform2d.rotationMatrix( body.orientation )
				acceleration = [ body.accelerationMagnitude, 0 ]
				m.Vec2.applyTransform( acceleration, orientationTransform )
				m.Vec2.scale( acceleration, frameTimeInS )
				m.Vec2.add( body.velocity, acceleration )

				frameMovement = m.Vec2.copy( body.velocity )
				m.Vec2.scale( frameMovement, frameTimeInS )

				m.Vec2.add( body.position, frameMovement )
