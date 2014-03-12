class @MapView extends Backbone.View
  el: '#map-canvas'
  
  initialize: =>
    @markers = []
    pageState.on 'coordinates_set', @displayPins
    pageState.on 'change:movie', @removePins
    pageState.on 'reset_movie', @removePins

  displayPins: =>
    _.each pageState.get('shootings').models, (shooting) =>
      marker = new google.maps.Marker
        position: new google.maps.LatLng(shooting.get('latitude'), shooting.get('longitude'))
        map: window.map
      @markers.push(marker)

  removePins: =>
    _.each @markers, (marker) ->
      marker.setMap(null)
