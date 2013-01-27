class TL.Routers.Main extends Backbone.Router
	routes:
		'': 'index'
	initialize: ->
		
	index: ->
		alert "fuck hello, bitches!"
		@view = new TL.Views.Main({el:"#content"})
	start: ->
		Backbone.history.start
			pushState: true
		
		
		