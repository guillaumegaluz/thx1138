class @Movies extends Backbone.Collection
  model: Movie

  filter: (query) =>
    return []  if query.trim() == ""
    filtered = []
    @.each (movie) =>
      filtered.push(movie) if movie.get('title').toLowerCase().match(query)
    return filtered
