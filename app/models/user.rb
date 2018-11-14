class User < ActiveRecord::Base

  has_many :user_beers
  has_many :beers, through: :user_beers
  has_many :styles, through: :beers
  has_many :breweries, through: :beers

end
