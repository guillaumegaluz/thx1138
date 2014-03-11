class @Shooting extends Backbone.Model
  initialize: =>
    @getCoordinates()

  getCoordinates: =>
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@get('locations')}&sensor=false"
    
    $.ajax
      type: 'GET'
      url: url
      dataType: 'json'
      success: (data) =>
        @setCoordinates(data)

  setCoordinates: (data) =>
    results = data["results"][0]
    if results
      coordinates = data["results"][0]["geometry"]["location"]
      @set('longitude', coordinates.lng)
      @set('latitude', coordinates.lat)
    query.trigger('coordinates_set')

