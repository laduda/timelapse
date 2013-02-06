class TL.Routers.Main extends Backbone.Router
	routes:
		'' : 'index'
		'/explore/:area' : 'explore'
		'video/#id': 'single'
		
	initialize: ->
		@view = new TL.Views.Main({el:'#TL'})
	explore: (area)->
		if area?
			#
		else
			@explore = new TL.Views.Explore()
			@view.$('#content').html @explore.el
		
	index: ->
		
	start: ->
		Backbone.history.start
			pushState: true
			
	single: (id) ->
		#show the view for video with id:#id
		
		
		