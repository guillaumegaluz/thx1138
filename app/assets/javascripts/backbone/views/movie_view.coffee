class @MovieView extends Backbone.View
  el: '.movie'
  events:
    'click .reset-button': 'resetMovie'
  
  initialize: =>
    pageState.on 'change:movie', @render
    pageState.on 'reset_movie', @clear

  render: =>
    @$el.show(0).html(JST['backbone/templates/movie'](movie: pageState.get('movie')))

  clear: =>
    @$el.empty().hide(0)

  resetMovie: =>
    pageState.trigger('reset_movie')
