module "ControlAliens", [ "Vec2" ], ( m ) ->
	( frameTimeInS, alienControls, bodies, fieldSize, createEntity ) ->
		for entityId, alienControl of alienControls
			body = bodies[ entityId ]

			# Rotate
			angularMomentumPerS = 0.5
			body.orientation += angularMomentumPerS * frameTimeInS


			# Move
			alienToWaypoint = m.Vec2.copy( alienControl.waypoint )
			m.Vec2.subtract( alienToWaypoint, body.position )

			distance = m.Vec2.length( alienToWaypoint )
			threshold = 10

			if distance < threshold
				x = Math.random() * fieldSize[ 0 ] - fieldSize[ 0 ] / 2
				y = Math.random() * fieldSize[ 1 ] - fieldSize[ 1 ] / 2
				alienControl.waypoint = [ x, y ]

				alienSpeed = 15

				velocity = m.Vec2.copy( alienControl.waypoint )
				m.Vec2.subtract( velocity, body.position )

				m.Vec2.normalize( velocity )
				m.Vec2.scale( velocity, alienSpeed )

				body.velocity = velocity


			# Shoot
			alienControl.tubeACooldown -= frameTimeInS
			alienControl.tubeBCooldown -= frameTimeInS

			numberOfShots = 0
			if alienControl.tubeACooldown <= 0
				alienControl.tubeACooldown = alienControl.tubeDelay
				numberOfShots += 1
			if alienControl.tubeBCooldown <= 0
				alienControl.tubeBCooldown = alienControl.tubeDelay
				numberOfShots += 1

			i = 0
			while i < numberOfShots
				createEntity( "missile", {
					position: body.position
					targetId: "miner0" } )
				i += 1
