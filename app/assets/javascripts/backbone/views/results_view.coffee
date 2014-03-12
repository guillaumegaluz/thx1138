class @ResultsViews extends Backbone.View
  el: '.results'
  maxNumberOfResultsToDisplay: 4
  events:
    'click .result': 'setMovie'

  initialize: =>
    pageState.on 'change:results', @render
    pageState.on 'change:movie', @clear

  render: =>
    return @clear() if pageState.get('query').trim() == ""
    @results = @getFirstResults(@maxNumberOfResultsToDisplay)
    if @results.length == 0 then @displayEmptyResult() else @displayResults()

  getFirstResults: (integer) =>
    results = []
    _.each pageState.get('results'), (result, i) ->
      results.push(result)  if i < integer
    return results

  displayResults: =>
    @clear()
    @$el.show(0)
    _.each @results, (result) =>
      @$el.append(JST['backbone/templates/result'](movie: result))

  clear: =>
    @$el.empty()

  displayEmptyResult: =>
    @$el.html(JST['backbone/templates/no_results'](query: pageState.get('query')))

  setMovie: (e) =>
    _.each @results, (movie) ->
      pageState.set('movie', movie)  if movie.get('id') == $(e.target).parent().parent().data('movie-id')
