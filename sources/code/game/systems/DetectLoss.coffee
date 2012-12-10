module "DetectLoss", [], ->
	module =
		( minerControls, destroyEntity ) ->
			for entityId, minerControl of minerControls
				console.log( minerControl.health )
				if minerControl.health <= 0
					destroyEntity( entityId )
