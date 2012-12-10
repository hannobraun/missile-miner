module "Logic", [ "Input", "Entities", "Vec2" ], ( m ) ->
	nextEntityId = 0

	entityFactories =
		"miner": ( args ) ->
			id = nextEntityId
			nextEntityId += 1

			entity =
				id: id
				components:
					"bodies":
						position: [ 0, 0 ]
					"imageIds": "miner.png"

	# There are functions for creating and destroying entities in the Entities
	# module. We will mostly use shortcuts however. They are declared here and
	# defined further down in initGameState.
	createEntity  = null
	destroyEntity = null

	module =
		createGameState: ->
			gameState =
				# Game entities are made up of components. The components will
				# be stored in this map.
				components: {}

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

		updateGameState: ( gameState, currentInput, gameTimeInS, frameTimeInS ) ->
			# Nothing to update.
