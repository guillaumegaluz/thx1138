require 'csv'

CSV.foreach(File.expand_path('../Film_Locations_in_San_Francisco.csv', __FILE__), :headers => true) do |row|
  @movie = Movie.find_by_title(row["Title"])

  if !@movie
    movie_attributes = {
      title: row["Title"],
      release_year: row["Release Year"],
      production_company: row[""],
      distributor: row["Production Company"],
      director: row["Director"],
      writer: row["Writer"],
      actor_1: row["Actor 1"],
      actor_2: row["Actor 2"],
      actor_3: row["Actor 3"]
    }
    @movie = Movie.create!(movie_attributes)
  end

  shooting_attributes = {
    movie_id: @movie.id,
    locations: row["Locations"],
    fun_fact: row["Fun Facts"]
  }
  Shooting.create!(shooting_attributes)
end
