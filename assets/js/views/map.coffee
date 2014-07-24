# window.initialize = ()->
#   @myLatlng = new google.maps.LatLng(30.044420, 31.235712)   #(@area_object.la, @area_object.lo)
#   @mapOptions =
#     zoom: 2
#     center: @myLatlng
#     mapTypeId: google.maps.MapTypeId.ROADMAP

#   @map = new google.maps.Map(document.getElementById("map"), @mapOptions)
#   input = document.getElementById('pac-input')
#   @map.controls[google.maps.ControlPosition.TOP_LEFT].push(input) 
#   searchBox = new google.maps.places.SearchBox(input)
#   google.maps.event.addListener searchBox, 'places_changed', ()->
#     places = searchBox.getPlaces()
#     console.log('cunt', places)
#   return
