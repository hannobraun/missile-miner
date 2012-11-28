module "SignalTest", [ "Signal" ], ( m ) ->
	describe "Signal", ->
		describe "each", ->
			it "should push the current value of a signal to each listener", ->
				signal = new m.Signal

				values = []
				signal.each ( v ) ->
					values.push( v )

				signal
					.push( 1 )
					.push( 2 )

				expect( values ).to.eql( [ 1, 2 ] )

		describe "map", ->
			it "should create a new signal with the mapped values", ->
				signal = new m.Signal

				mapped = signal.map ( v ) ->
					v * 2

				values = []
				mapped.each ( v ) ->
					values.push( v )

				signal
					.push( 1 )
					.push( 2 )

				expect( values ).to.eql( [ 2, 4 ] )

		describe "filter", ->
			it "should create a new signal with the filtered values", ->
				signal = new m.Signal

				filtered = signal.filter ( v ) ->
					v % 2 == 0

				values = []
				filtered.each ( v ) ->
					values.push( v )

				signal
					.push( 1 )
					.push( 2 )

				expect( values ).to.eql( [ 2 ] )

		describe "reduce", ->
			it "should create a new signal with the reduced values of values from the original signal", ->
				signal = new m.Signal

				reducedSignal = signal.reduce 0, ( acc, v ) ->
					acc + v

				values = []
				reducedSignal.each ( v ) ->
					values.push( v )

				signal
					.push( 1 )
					.push( 2 )

				expect( values ).to.eql( [ 1, 3 ] )

load( "SignalTest" )
