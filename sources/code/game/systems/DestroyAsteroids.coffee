module "DestroyAsteroids", [], ( m ) ->
	module =
		( asteroidControls, destroyEntity ) ->
			for entityId, asteroidControl of asteroidControls
				if asteroidControl.currentOre <= 0
					destroyEntity( entityId )
