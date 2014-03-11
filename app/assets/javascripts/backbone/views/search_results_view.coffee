class @SearchResultsViews extends Backbone.View
  el: '.search-results'

  initialize: =>
    query.on 'change:currentResults', @render

  render: =>
    @clear()
    console.log @getFirstResults(3)
    @$el.show(0)
    _.each @getFirstResults(3), (result) =>
      @$el.append(JST['backbone/templates/search_result'](movie: result))

  getFirstResults: (integer) =>
    results = []
    _.each query.get('currentResults'), (result, i) ->
      results.push(result)  if i < integer
    return results

  clear: =>
    @$el.empty()
