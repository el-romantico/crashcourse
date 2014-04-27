# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

markers = []
map = undefined;

initializeMarkers = ->
  i = 0
  $.ajax(url: "/geo_scope_courses").done (courses) ->
    while i < courses.length
      course = courses[i]
      latLng = new google.maps.LatLng(course.lat, course.lng)
      marker = new google.maps.Marker(position: latLng)
      markers.push marker
      i++
    markerCluster = new MarkerClusterer(map, markers)
    return

initializeMap = ->
  center = new google.maps.LatLng(42.9419, 25.1419)
  map = new google.maps.Map(document.getElementById("map"),
    zoom: 8
    center: center
    mapTypeId: google.maps.MapTypeId.ROADMAP
  )

  initializeMarkers()
  return
google.maps.event.addDomListener window, "load", initializeMap
return
