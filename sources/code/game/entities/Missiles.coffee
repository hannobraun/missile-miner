module "Missiles", [ "Vec2", "Bodies", "MissileControls" ], ( m ) ->
	nextEntityId = 0

	module =
		createMissile: ( args ) ->
			body = m.Bodies.createBody()
			body.position = m.Vec2.copy( args.position )
			body.radius   = 1

			missileControl = m.MissileControls.createMissileControl( args.targetId )

			id = "missile#{ nextEntityId }"
			nextEntityId += 1

			entity =
				id: id
				components:
					"bodies"         : body
					"missileControls": missileControl
					"imageIds"       : "missile.png"
