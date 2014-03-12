class @MovieView extends Backbone.View
  el: '.movie'
  events:
    'click .reset-button': 'resetCurrentMovie'
  
  initialize: =>
    pageState.on 'change:currentMovie', @render
    pageState.on 'reset_movie', @clear

  render: =>
    @$el.show(0).html(JST['backbone/templates/movie'](movie: pageState.get('currentMovie')))

  clear: =>
    @$el.empty().hide(0)

  resetCurrentMovie: =>
    pageState.trigger('reset_movie')
