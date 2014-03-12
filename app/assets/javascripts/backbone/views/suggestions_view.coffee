class @SuggestionsView extends Backbone.View
  el: '.suggestions'

  initialize: =>
    @render()
    pageState.on "change:movie", @hide
    pageState.on "reset_movie", @render
    pageState.on 'change:query', @toggle

  render: =>
    @$el.show(0).html(JST['backbone/templates/suggestions'](movies: movies.getRandomMovies()))
    @bindEvent()

  bindEvent: =>
    $('.random-movie').on 'click', (e) =>
      pageState.set('movie', movies.at($(e.target).data('movie-id') - 1))

  hide: =>
    @$el.hide(0)

  show: =>
    @$el.show(0)

  toggle: =>
    if pageState.get('query').trim() != "" || pageState.get('movie') then @hide() else @show()
