module "Logic", [ "Input", "Entities", "Vec2", "Asteroids", "Miners", "Bodies", "MinerControls", "DetectCollisions", "DetectLoss", "ActivateMiningLaser" ], ( m ) ->
	entityFactories =
		"asteroid": m.Asteroids.createAsteroid
		"miner"   : m.Miners.createMiner

	# There are functions for creating and destroying entities in the Entities
	# module. We will mostly use shortcuts however. They are declared here and
	# defined further down in initGameState.
	createEntity  = null
	destroyEntity = null

	module =
		createGameState: ( fieldSize ) ->
			gameState =
				# Game entities are made up of components. The components will
				# be stored in this map.
				components: {}

				fieldSize: fieldSize

		initGameState: ( gameState ) ->
			# These are the shortcuts we will use for creating and destroying
			# entities.
			createEntity = ( type, args ) ->
				m.Entities.createEntity(
					entityFactories,
					gameState.components,
					type,
					args )
			destroyEntity = ( entityId ) ->
				m.Entities.destroyEntity(
					gameState.components,
					entityId )

			createEntity( "miner", {} )

			for i in [1..10]
				createEntity( "asteroid", {
					fieldSize: gameState.fieldSize } )


		updateGameState: ( gameState, currentInput, gameTimeInS, frameTimeInS ) ->
			components = gameState.components
			fieldSize  = gameState.fieldSize

			asteroids     = components[ "asteroids" ]
			bodies        = components[ "bodies" ]
			minerControls = components[ "minerControls" ]

			m.MinerControls.processInput(
				currentInput,
				frameTimeInS,
				gameState.components.minerControls,
				gameState.components.bodies )
			m.Bodies.updateBodies(
				frameTimeInS,
				gameState.components.bodies )

			for entityId, body of bodies
				for i in [0..1]
					limit      = fieldSize[ i ] / 2
					coordinate = body.position[ i ]

					if coordinate > limit
						body.position[ i ] = -limit + ( coordinate - limit )
					if coordinate < -limit
						body.position[ i ] = limit - ( coordinate - limit )

			m.DetectCollisions(
				minerControls,
				asteroids,
				bodies )
			m.DetectLoss(
				minerControls,
				destroyEntity )
			m.ActivateMiningLaser(
				minerControls,
				bodies )
