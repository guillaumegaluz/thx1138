class @MovieView extends Backbone.View
  el: '.current-movie'
  events:
    'click .reset-button': 'resetCurrentMovie'
  
  initialize: =>
    query.on 'change:currentMovie', @render
    query.on 'reset_movie', @clear

  render: =>
    @$el.show(0).html(JST['backbone/templates/movie'](movie: query.get('currentMovie')))

  clear: =>
    @$el.empty().hide(0)

  resetCurrentMovie: =>
    query.trigger('reset_movie')
