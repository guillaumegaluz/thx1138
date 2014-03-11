class @Query extends Backbone.Model
  defaults:
    currentQuery: null
    currentResults: null

  initialize: =>
    @on 'change:currentQuery', @getMovies

  getMovies: =>
    @set('currentResults', movies.filter(@get('currentQuery')))
