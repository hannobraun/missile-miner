module "DetectLoss", [], ->
	module =
		( minerControls, destroyEntity ) ->
			for entityId, minerControl of minerControls
				if minerControl.health <= 0
					destroyEntity( entityId )
