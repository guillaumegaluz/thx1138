class @ResultsViews extends Backbone.View
  el: '.results'
  maxNumberOfResultsToDisplay: 4
  events:
    'click .result': 'setCurrentMovie'

  initialize: =>
    pageState.on 'change:currentResults', @render
    pageState.on 'change:currentMovie', @clear

  render: =>
    return @clear() if pageState.get('currentQuery').trim() == ""
    @results = @getFirstResults(@maxNumberOfResultsToDisplay)
    if @results.length == 0 then @displayEmptyResult() else @displayResults()

  getFirstResults: (integer) =>
    results = []
    _.each pageState.get('currentResults'), (result, i) ->
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
    @$el.html(JST['backbone/templates/no_results'](query: pageState.get('currentQuery')))

  setCurrentMovie: (e) =>
    _.each @results, (movie) ->
      pageState.set('currentMovie', movie)  if movie.get('id') == $(e.target).parent().parent().data('movie-id')
