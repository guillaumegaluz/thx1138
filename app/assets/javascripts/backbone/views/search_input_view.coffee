class @SearchInputView extends Backbone.View
  el: '.input-wrapper input'
  events:
    'keyup': 'setCurrentQuery'

  setCurrentQuery: =>
    query.set('currentQuery', $('.input-wrapper input').val())
