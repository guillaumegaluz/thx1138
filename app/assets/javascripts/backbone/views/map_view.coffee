class @MapView extends Backbone.View
  el: '#map-canvas'
  
  initialize: =>
    @markers = []
    query.on 'coordinates_set', @displayPins
    query.on 'reset_movie', @removePins

  displayPins: =>
    _.each query.get('currentShootings').models, (shooting) ->
      marker = new google.maps.Marker
        position: new google.maps.LatLng(shooting.get('latitude'), shooting.get('longitude'))
        map: window.map
        title: "Hello World!"
      @markers << marker

  updatePins: =>
    @removePins()
    @displayPins()

  removePins: =>
    console.log "removePins"
    _.each @markers, (marker) ->
      marker.setMap(null);
