class ShootingsController < ApplicationController
  def index
    # On page load, send only the basic metadata: title, year & director.
    @movies = Shooting.all.map { |movie|
      movie.as_json(:only => :id, :methods => [:title, :release_year, :director])
    }
    puts @movies
  end
end
