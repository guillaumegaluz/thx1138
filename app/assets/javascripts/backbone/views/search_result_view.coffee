# class @SearchResultView extends Backbone.View
#   el: '.search-result'
#   events:
#     'click': 'setCurrentMovie'
  
#   initialize: (movie) =>
#     @movie = movie
#     console.log "creating SearchResultView for ", movie

#   render: =>
#     JST['backbone/templates/search_result'](movie: @movie)

#   setCurrentMovie: =>
#     console.log "hello"
#     query.set('currentMovie', @movie)
