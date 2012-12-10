module "Graphics", [ "Rendering", "Vec2" ], ( m ) ->
	module =
		createRenderState: ->
			renderState =
				renderables: []

		updateRenderState: ( renderState, gameState ) ->
			renderables = renderState.renderables

			renderables.length = 0

			for entityId, body of gameState.components.bodies
				imageId = gameState.components.imageIds[ entityId ]

				renderable = m.Rendering.createRenderable( "image", {
					position   : body.position
					orientation: body.orientation },
					imageId )

				renderables.push( renderable )
