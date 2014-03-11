class @Shooting extends Backbone.Model
  initialize: =>
    @setCoordinates()

  setCoordinates: =>
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{@get('locations')}&sensor=false"
    $.ajax
      type: 'GET'
      url: url
      dataType: 'json'
      success: (data) =>
        results = data["results"][0]
        if results
          coordinates = data["results"][0]["geometry"]["location"]
          @set('longitude', coordinates.lng)
          @set('latitude', coordinates.lat)

          marker = new google.maps.Marker
            position: new google.maps.LatLng(@get('latitude'), @get('longitude'))
            map: window.map
            title: "Hello World!"
