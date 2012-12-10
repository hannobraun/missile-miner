module "Bodies", [ "Vec2", "Transform2d" ], ( m ) ->
	module =
		createBody: () ->
			body =
				position   : [ 0, 0 ]
				velocity   : [ 0, 0 ]
				orientation: 0

		updateBodies: ( frameTimeInS, bodies ) ->
			for entityId, body of bodies
				orientationTransform =
					m.Transform2d.rotationMatrix( body.orientation )

				frameMovement = m.Vec2.copy( body.velocity )
				m.Vec2.scale( frameMovement, frameTimeInS )
				m.Vec2.applyTransform( frameMovement, orientationTransform )

				m.Vec2.add( body.position, frameMovement )
