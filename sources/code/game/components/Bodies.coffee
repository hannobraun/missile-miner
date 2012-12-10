module "Bodies", [ "Vec2" ], ( m ) ->
	module =
		createBody: () ->
			body =
				position    : [ 0, 0 ]
				velocity    : [ 0, -100 ]
