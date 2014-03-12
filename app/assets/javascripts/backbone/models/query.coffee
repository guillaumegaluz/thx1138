class @PageState extends Backbone.Model
  defaults:
    query: null
    results: null
    movie: null
    shootings: null

  initialize: =>
    @on 'change:query', @setResults
    @on 'change:movie', @fetchShootings

  setResults: =>
    @set('results', movies.filter(@get('query')))

  fetchShootings: =>
    $.ajax
      type: 'GET'
      url: "/shootings/#{@get('movie').get('id')}"
      dataType: 'json'
      success: (data) => 
        @set('shootings', new Shootings(data))
