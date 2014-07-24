class TL.Routers.Main extends Backbone.Router
	routes:
		'' : 'explore'
		'explore': 'explore'
#		'explore/:area' : 'explore'
		'video/:name/:id': 'videoPage'
		'tutorials': 'tutorials'
		'about': 'about'
		
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
			
			
	about: ->
		$('#content').empty()
		@about = new TL.Views.About
			el: '#content'
	
	videoPage: (name, id) ->
		#show the view for video with id:#id
		$('#content').empty()
		@videoPage = new TL.Views.VideoPage
			el: '#content'
			id: id
			
	index: ->
		
	start: ->
		Backbone.history.start
			pushState: true

		
