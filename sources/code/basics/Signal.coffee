module "Signal", [], ( m ) ->
	class Signal
		constructor: ->
			@listeners = []

		push: ( value ) ->
			for listener in @listeners
				listener( value )

			this

		each: ( f ) ->
			@listeners.push( f )

		map: ( f ) ->
			mapped = new Signal

			@listeners.push ( value ) ->
				mapped.push( f( value ) )

			mapped

		filter: ( f ) ->
			filtered = new Signal

			@listeners.push ( value ) ->
				if f( value )
					filtered.push( value )

			filtered

		reduce: ( initialAcc, f ) ->
			reduced = new Signal

			acc = initialAcc

			@listeners.push ( value ) ->
				acc = f( acc, value )
				reduced.push( acc )

			reduced
