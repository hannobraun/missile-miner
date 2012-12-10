module "Miners", [ "Bodies" ], ( m ) ->
	nextEntityId = 0

	module =
		createMiner: ( args ) ->
			body = m.Bodies.createBody()

			id = nextEntityId
			nextEntityId += 1

			entity =
				id: id
				components:
					"bodies"  : body
					"miners"  : {}
					"imageIds": "miner.png"