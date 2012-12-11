module "SpawnAlien", [], ( m ) ->
	( gameState, frameTimeInS, createEntity, fieldSize ) ->
		gameState.nextAlienCountdownInS -= frameTimeInS
		if gameState.nextAlienCountdownInS <= 0
			gameState.nextAlienCountdownInS = 30

			createEntity( "alien", {
				fieldSize: gameState.fieldSize } )
