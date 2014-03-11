class @MapView extends Backbone.View
  el: '#map-canvas'
  
  initialize: =>
    @markers = []
    query.on 'coordinates_set', @displayPins
    query.on 'change:currentMovie', @removePins
    query.on 'reset_movie', @removePins

  displayPins: =>
    _.each query.get('currentShootings').models, (shooting) =>
      marker = new google.maps.Marker
        position: new google.maps.LatLng(shooting.get('latitude'), shooting.get('longitude'))
        map: window.map
      @markers.push(marker)

  removePins: =>
    _.each @markers, (marker) ->
      marker.setMap(null)
