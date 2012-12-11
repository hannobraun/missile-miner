module "ControlMissiles", [ "Vec2" ], ( m ) ->
	( missileControls, bodies, destroyEntity ) ->
		for missileId, missileControl of missileControls
			missileBody = bodies[ missileId ]
			targetBody  = bodies[ missileControl.targetId ]

			if targetBody?
				missileToTarget = m.Vec2.copy( targetBody.position )
				m.Vec2.subtract( missileToTarget, missileBody.position )

				if missileControl.targetAcquired
					missileBody.orientation = Math.atan2(
						missileBody.velocity[ 1 ],
						missileBody.velocity[ 0 ] )
				else
					missileSpeed = 100

					m.Vec2.normalize( missileToTarget )
					m.Vec2.scale( missileToTarget, missileSpeed )

					missileBody.velocity = missileToTarget

					missileControl.targetAcquired = true
			else
				destroyEntity( missileId )
