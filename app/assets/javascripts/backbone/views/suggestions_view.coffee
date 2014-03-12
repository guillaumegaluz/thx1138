class @SuggestionsView extends Backbone.View
  el: '.suggestions'

  initialize: =>
    @render()
    pageState.on "change:currentMovie", @hide
    pageState.on "reset_movie", @render
    pageState.on 'change:currentQuery', @toggle

  render: =>
    @$el.show(0).html(JST['backbone/templates/suggestions'](movies: movies.getRandomMovies()))
    @bindEvent()

  bindEvent: =>
    $('.random-movie').on 'click', (e) =>
      pageState.set('currentMovie', movies.at($(e.target).data('movie-id') - 1))

  hide: =>
    @$el.hide(0)

  show: =>
    @$el.show(0)

  toggle: =>
    if pageState.get('currentQuery').trim() != "" || pageState.get('currentMovie') then @hide() else @show()
