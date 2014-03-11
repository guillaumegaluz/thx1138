class @SearchResultsViews extends Backbone.View
  el: '.search-results'
  numberOfResultsToDisplay: 3
  events:
    'click .search-result': 'setCurrentMovie'

  initialize: =>
    query.on 'change:currentResults', @render

  render: =>
    @results = @getFirstResults(@numberOfResultsToDisplay)
    if @results.length == 0 then @displayEmptyResult() else @displayResults()

  getFirstResults: (integer) =>
    results = []
    _.each query.get('currentResults'), (result, i) ->
      results.push(result)  if i < integer
    return results

  displayResults: =>
    @clear()
    @$el.show(0)
    _.each @results, (result) =>
      @$el.append(JST['backbone/templates/search_result'](movie: result))

  clear: =>
    @$el.empty()

  displayEmptyResult: =>
    @$el.html("no results")

  setCurrentMovie: (e) =>
    _.each @results, (movie) ->
      query.set('currentMovie', movie)  if movie.get('id') == $(e.target).parent().parent().data('movie-id')
    console.log query.get('currentMovie')
