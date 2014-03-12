class @InputView extends Backbone.View
  el: '.input-wrapper input'
  events:
    'keyup': 'setCurrentQuery'

  initialize: =>
    pageState.on 'change:currentMovie', @empty

  setCurrentQuery: =>
    pageState.set('currentQuery', @$el.val())

  empty: =>
    @$el.val("")
