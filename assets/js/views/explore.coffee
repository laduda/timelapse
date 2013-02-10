class TL.Views.Explore extends Backbone.View
	initialize: ->
		_.bindAll @
		@markers = new TL.Collections.VideoObjects()
		@markers.fetch()
		@markers.on 'reset', @renderMarkers, @
		@area = @options.area || null
		@template = Handlebars.templates['explore/index']
		@render()
		$ =>
		  @myLatlng = new google.maps.LatLng(-25.363882, 131.044922)
		  @mapOptions =
		    zoom: 4
		    center: @myLatlng
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		  @map = new google.maps.Map(document.getElementById("map"), @mapOptions)
	render: ->
		@$el.html @template({area:@area})
		
	renderMarkers: ->
		$ =>
			@markers.each(@putMarker, @)
	putMarker: (m) ->
		if m.get('LatLang')
			la = m.get('LatLang').latitude
			lo = m.get('LatLang').longitude
			name = m.get('city_name')
			console.log "coordinates of marker:", lo, la, name
			myLatlng = new google.maps.LatLng(la, lo)
			marker = new google.maps.Marker(
		    position: myLatlng
		    map: @map
		    title: name
		  )