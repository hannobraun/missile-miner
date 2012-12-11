module "MissileControls", [], ( m ) ->
	module =
		createMissileControl: ( targetId ) ->
			missileControl =
				targetId: targetId
