module "Miners", [ "Bodies", "MinerControls" ], ( m ) ->
	nextEntityId = 0

	module =
		createMiner: ( args ) ->
			body = m.Bodies.createBody()
			body.radius = 4

			id = "miner#{ nextEntityId }"
			nextEntityId += 1

			entity =
				id: id
				components:
					"bodies"       : body
					"minerControls": m.MinerControls.createMinerControl()
					"imageIds"     : "miner.png"
