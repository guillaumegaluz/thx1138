class @MapView extends Backbone.View
  el: '#map-canvas'
  
  initialize: =>
    query.on 'change:currentShootings', @display

  display: =>
    console.log "DISPLAY"
