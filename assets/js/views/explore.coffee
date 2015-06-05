class TL.Views.Explore extends Backbone.View
	initialize: ->
		_.bindAll @
#		@loadAreas()
		Markers = Parse.Collection.extend(
		  model: TL.Models.VideoObject
		  query: (new Parse.Query(TL.Models.VideoObject)).limit(500)
		)
		@markers = new Markers()
		@markers.fetch()
		@markers.on 'reset', @renderMarkers, @
		@renderPopular
		@template = Handlebars.templates['explore/index']
		@render()
		$ =>
		  @LatLang = new (google.maps.LatLng)(36.393156, 25.461509)   #(@area_object.la, @area_object.lo)
		  @mapOptions =
		    zoom: 2
		    scrollwheel: false
		    overviewMapControl: true
		    streetViewControl: false
		    zoomControl: true
		    zoomControlOptions: position: google.maps.ControlPosition.RIGHT_CENTER
		    panControl: true
		    panControlOptions: position: google.maps.ControlPosition.RIGHT_CENTER
		    center: new (google.maps.LatLng)(30.448674, -4.921875)
		    mapTypeId: google.maps.MapTypeId.ROADMAP
		  @map = new google.maps.Map(document.getElementById("map"), @mapOptions)
			google.maps.event.addDomListener window, 'resize', ->
  			center = map.getCenter()
  			google.maps.event.trigger map, 'resize'
  			map.setCenter center


	render: ->
		@$el.html @template#({area:@area})
	
	renderPopular: ->
    @thumbnails = new TL.Views.VideoThumbnails
     el: '#popular'
	  
	renderMarkers: ->
		$ =>
			@markers.each(@putMarker, @)
	putMarker: (m) ->
		if m.get('LatLang')
			la = m.get('LatLang').latitude
			lo = m.get('LatLang').longitude
			name = m.get('city_name')
			myLatlng = new google.maps.LatLng(la, lo)
			pin =
				url: 'images/pin3.png'
				scaledSize: new (google.maps.Size)(23, 33) 
				# scaledSize: new (google.maps.Size)(23, 15)
			marker = new google.maps.Marker(
		    position: myLatlng
		    map: @map
		    title: name
		    icon: pin
			animation: google.maps.Animation.DROP
			)
      
			google.maps.event.addListener marker, "click", ->
				Backbone.history.navigate("video/city/#{m.id}", {trigger: true})

		      

		
		
		
