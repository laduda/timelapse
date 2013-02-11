class TL.Views.Explore extends Backbone.View
	initialize: ->
		_.bindAll @
		@loadAreas()
		@markers = new TL.Collections.VideoObjects()
		@markers.fetch()
		@markers.on 'reset', @renderMarkers, @
		@area = @options.area || null
		if @area
			area = @area
			@area_object = _.find(@areas, (a) ->
				if a.id == area
					a
			)
		@template = Handlebars.templates['explore/index']
		@render()
		$ =>
		  @myLatlng = new google.maps.LatLng(@area_object.la, @area_object.lo)
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
			myLatlng = new google.maps.LatLng(la, lo)
			marker = new google.maps.Marker(
		    position: myLatlng
		    map: @map
		    title: name
				animation: google.maps.Animation.DROP
		  )
		
	loadAreas: ->
		@areas = [
		  id: "africa"
		  color: "#24f34a"
		  passZoomValuesToTarget: true
		  url: "/explore/africa"
		  la: 3.864255
		  lo: 29.882813
		,
		  id: "asia"
		  color: "#fcff00"
		  passZoomValuesToTarget: true
		  url: "/explore/asia"
		  la: 42.811522
		  lo: 110.390625
		,
		  id: "australia"
		  color: "#ef820d"
		  passZoomValuesToTarget: true
		  url: "/explore/australia"
		  la: -25.274398
		  lo: 133.775136
		,
		  id: "europe"
		  color: "#ff6666"
		  passZoomValuesToTarget: true
		  url: "/explore/europe"
		  la: 50.075538
		  lo: 14.437801
		,
		  id: "north_america"
		  color: "#f67200"
		  passZoomValuesToTarget: true
		  url: "/explore/northamerica"
		  la: 51.253775
		  lo: -85.323214
		,
		  id: "south_america"
		  color: "#e562f2"
		  passZoomValuesToTarget: true
		  url: "/explore/southamerica"
		  la: -13.068777
		  lo: -57.128906
		]