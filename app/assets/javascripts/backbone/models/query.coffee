class @PageState extends Backbone.Model
  defaults:
    currentQuery: null
    currentResults: null
    currentMovie: null
    currentShootings: null

  initialize: =>
    @on 'change:currentQuery', @getMovies
    @on 'change:currentMovie', @fetchShootings

  getMovies: =>
    @set('currentResults', movies.filter(@get('currentQuery')))

  fetchShootings: =>
    $.ajax
      type: 'GET'
      url: "/shootings/#{@get('currentMovie').get('id')}"
      dataType: 'json'
      success: (data) => 
        @set('currentShootings', new Shootings(data))
