module "ControlMissiles", [ "Vec2", "Transform2d" ], ( m ) ->
	( frameTimeInS, missileControls, bodies, destroyEntity ) ->
		for missileId, missileControl of missileControls
			missileBody = bodies[ missileId ]
			targetBody  = bodies[ missileControl.targetId ]

			if targetBody?
				missileToTarget = m.Vec2.copy( targetBody.position )
				m.Vec2.subtract( missileToTarget, missileBody.position )

				if missileControl.targetAcquired
					angle = m.Vec2.dot( missileToTarget, missileBody.velocity )
					angle /= m.Vec2.length( missileToTarget ) * m.Vec2.length( missileBody.velocity )
					angle = Math.acos( angle )

					perpDotProduct = m.Vec2.perpDot( missileBody.velocity, missileToTarget )
					rotationDirection = if perpDotProduct == 0
						if m.Vec2.dot( missileBody.velocity, missileToTarget ) > 0
							0
						else
							-1
					else if perpDotProduct < 0 then -1 else 1

					rotationPerS = 1.2
					angle = rotationDirection * rotationPerS * frameTimeInS

					t = m.Transform2d.rotationMatrix( angle )
					m.Vec2.applyTransform( missileBody.velocity, t )

					missileBody.orientation = Math.atan2(
						missileBody.velocity[ 1 ],
						missileBody.velocity[ 0 ] )
				else
					missileSpeed = 70

					m.Vec2.normalize( missileToTarget )
					m.Vec2.scale( missileToTarget, missileSpeed )

					missileBody.velocity = missileToTarget

					missileControl.targetAcquired = true
			else
				destroyEntity( missileId )
