class Shooting < ActiveRecord::Base
  def self.unique_movies
    Shooting.select(:title).distinct
  end
end
