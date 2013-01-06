class TL.Routers.Main extends Backbone.Router
	routes:
		'': 'index'
	initialize: ->
		
	index: ->
		console.log 'HUI'
	
	start: ->
		Backbone.history.start
			pushState:true
		
		