class User < ActiveRecord::Base

  has_many :hads
  has_many :beers, through: :hads
  has_many :styles, through: :beers
  has_many :breweries, through: :beers

end
