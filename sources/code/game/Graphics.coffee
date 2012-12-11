module "Graphics", [ "Rendering", "Vec2" ], ( m ) ->
	module =
		createRenderState: ->
			renderState =
				renderables: []

		updateRenderState: ( renderState, gameState ) ->
			components = gameState.components

			bodies        = components.bodies
			imageIds      = components.imageIds
			minerControls = components.minerControls

			renderables = renderState.renderables

			renderables.length = 0

			for entityId, minerControl of minerControls
				console.log( minerControl.laserEfficiency )

			for entityId, body of bodies
				imageId = imageIds[ entityId ]

				renderable = m.Rendering.createRenderable( "image", {
					position   : body.position
					orientation: body.orientation },
					imageId )

				renderables.push( renderable )
