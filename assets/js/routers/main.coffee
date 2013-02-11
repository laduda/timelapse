class TL.Routers.Main extends Backbone.Router
	routes:
		'' : 'index'
		'explore': 'explore'
		'explore/:area' : 'explore'
		'video/:id': 'single'
		'tutorials': 'tutorials'
		
	initialize: ->
		@view = new TL.Views.Main({el:'#TL'})
		
	explore: (area)->
		$('#content').empty()
		@explore = new TL.Views.Explore
			el: '#content'
			area:area
		
	tutorials: ->
		$('#content').empty()
		@tutorials = new TL.Views.Tutorials
			el: '#content'
			
	index: ->
		
	start: ->
		Backbone.history.start
			pushState: true
			
	single: (id) ->
		#show the view for video with id:#id
		
		
		