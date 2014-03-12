class @InputView extends Backbone.View
  el: '.input-wrapper input'
  events:
    'keyup': 'setQuery'

  initialize: =>
    pageState.on 'change:movie', @empty

  setQuery: =>
    pageState.set('query', @$el.val())

  empty: =>
    @$el.val("")
