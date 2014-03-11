class Movie < ActiveRecord::Base
  has_many :shootings

  validates_uniqueness_of :title
end
