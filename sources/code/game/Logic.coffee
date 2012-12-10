module "Logic", [ "Input", "Entities", "Vec2" ], ( m ) ->
	nextEntityId = 0

	entityFactories =
		"miner": ( args ) ->
			body =
				position    : [ 0, 0 ]
				velocity    : [ 0, -100 ]

			id = nextEntityId
			nextEntityId += 1

			entity =
				id: id
				components:
					"bodies"  : body
					"miners"  : {}
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
			for entityId, body of gameState.components.bodies
				frameMovement = m.Vec2.copy( body.velocity )
				m.Vec2.scale( frameMovement, frameTimeInS )

				m.Vec2.add( body.position, frameMovement )
