class TL.Routers.Main extends Backbone.Router
	routes:
		'': 'index'
	initialize: ->
		
	index: ->
		alert "fuck hello, bitches!"
	start: ->
		Backbone.history.start
			pushState: true
		
		
		