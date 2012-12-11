module "MoveAliens", [ "Vec2" ], ( m ) ->
	( frameTimeInS, alienControls, bodies, fieldSize ) ->
		for entityId, alienControl of alienControls
			body = bodies[ entityId ]

			angularMomentumPerS = 0.5
			body.orientation += angularMomentumPerS * frameTimeInS

			alienToWaypoint = m.Vec2.copy( alienControl.waypoint )
			m.Vec2.subtract( alienToWaypoint, body.position )

			distance = m.Vec2.length( alienToWaypoint )
			threshold = 10

			if distance < threshold
				x = Math.random() * fieldSize[ 0 ] - fieldSize[ 0 ] / 2
				y = Math.random() * fieldSize[ 1 ] - fieldSize[ 1 ] / 2
				alienControl.waypoint = [ x, y ]

				alienSpeed = 20

				velocity = m.Vec2.copy( alienControl.waypoint )
				m.Vec2.subtract( velocity, body.position )

				m.Vec2.normalize( velocity )
				m.Vec2.scale( velocity, alienSpeed )

				body.velocity = velocity
