module "Graphics", [ "Rendering", "Vec2" ], ( m ) ->
	module =
		createRenderState: ( displaySize ) ->
			renderState =
				renderables: []
				displaySize: displaySize

		updateRenderState: ( renderState, gameState ) ->
			components = gameState.components

			bodies        = components.bodies
			imageIds      = components.imageIds
			minerControls = components.minerControls

			renderables = renderState.renderables

			renderables.length = 0

			for entityId, minerControl of minerControls
				if minerControl.laserEfficiency > 0
					minerBody    = bodies[ entityId ]
					asteroidBody = bodies[ minerControl.nearestAsteroidId ]

					maxWidth = 5
					width    = maxWidth * minerControl.laserEfficiency

					laser = m.Rendering.createRenderable( "line", {
						start: minerBody.position
						end  : asteroidBody.position
						width: width
						color: "rgb(255,255,0)" } )

					renderables.push( laser )

			for entityId, body of bodies
				imageId = imageIds[ entityId ]

				renderable = m.Rendering.createRenderable( "image", {
					position   : body.position
					orientation: body.orientation },
					imageId )

				renderables.push( renderable )

			score = m.Rendering.createRenderable( "text", {
				text    : Math.floor( gameState.score ),
				position: [ 0, -( renderState.displaySize[ 1 ] / 2 - 30 ) ]
				color   : "rgb(255,255,0)"
				font    : "20pt Arial" } )
			renderables.push( score )
