class @SuggestionsView extends Backbone.View
  el: '.suggestions'

  initialize: =>
    @render()
    query.on "change:currentMovie", @hide
    query.on "reset_movie", @render
    query.on 'change:currentQuery', @toggle

  render: =>
    @$el.show(0).html(JST['backbone/templates/suggestions'](movies: movies.getRandomMovies()))
    @bindEvent()

  bindEvent: =>
    $('.random-movie').on 'click', (e) =>
      query.set('currentMovie', movies.at($(e.target).data('movie-id') - 1))

  hide: =>
    @$el.hide(0)

  show: =>
    @$el.show(0)

  toggle: =>
    if query.get('currentQuery').trim() != "" || query.get('currentMovie') then @hide() else @show()
