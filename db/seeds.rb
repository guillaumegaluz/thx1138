require 'csv'

CSV.foreach(File.expand_path('../Film_Locations_in_San_Francisco.csv', __FILE__), :headers => true) do |row|
  movie_attributes = {
    title: row["Title"],
    release_year: row["Release Year"],
    locations: row["Locations"],
    fun_fact: row["Fun Facts"],
    production_company: row[""],
    distributor: row["Production Company"],
    director: row["Director"],
    writer: row["Writer"],
    actor_1: row["Actor 1"],
    actor_2: row["Actor 2"],
    actor_3: row["Actor 3"]
  }
  Movie.create!(movie_attributes)
end
