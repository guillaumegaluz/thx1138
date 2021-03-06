class @Movies extends Backbone.Collection
  model: Movie

  filter: (query) =>
    return []  if query.trim() == ""
    filtered = []
    @.each (movie) =>
      filtered.push(movie) if movie.get('title').toLowerCase().match(query.toLowerCase())
    return filtered

  getRandomMovies: =>
    randMovies = []
    _(3).times =>
      randMovies.push(@.at(Math.floor(Math.random() * @.models.length)))
    return randMovies
