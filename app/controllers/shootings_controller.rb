class ShootingsController < ApplicationController
  def index
    @movies = Shooting.unique_movies
  end
end
