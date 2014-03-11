class @SearchInputView extends Backbone.View
  el: '.input-wrapper input'
  events:
    'keyup': 'setCurrentQuery'

  initialize: =>
    query.on 'change:currentMovie', @empty

  setCurrentQuery: =>
    query.set('currentQuery', @$el.val())

  empty: =>
    @$el.val("")
