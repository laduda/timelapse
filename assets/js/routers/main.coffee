class TL.Routers.Main extends Backbone.Router
	routes:
		'': 'index'
		'video/#id': 'single'
		
	initialize: ->
		
	index: ->
		@view = new TL.Views.Main({el:'#TL'})
	start: ->
		Backbone.history.start
			pushState: true
			
	single: (id) ->
		#show the view for video with id:#id
		
		
		