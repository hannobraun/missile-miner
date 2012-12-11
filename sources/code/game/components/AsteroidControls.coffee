module "AsteroidControls", [], ( m ) ->
	module =
		createAsteroidControl: ->
			asteroidControl =
				initialRadius: 20

				initialOre: 100
				currentOre: 100
