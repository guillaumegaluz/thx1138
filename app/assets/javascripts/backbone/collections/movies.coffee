class @Movies extends Backbone.Collection
  model: Movie

  filter: (query) =>
    return []  if query.trim() == ""
    filtered = []
    @.each (movie) =>
      filtered.push(movie) if movie.get('title').toLowerCase().match(query)
    return filtered

  getRandomMovies: =>
    randMovies = []
    _(3).times =>
      randMovies.push(movies.at(Math.floor(Math.random() * movies.models.length)))
    return randMovies
