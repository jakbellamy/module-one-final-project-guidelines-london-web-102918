class User < ActiveRecord::Base

  has_many :user_beers
  has_many :beers, through: :user_beers
  has_many :styles, through: :beers
  has_many :breweries, through: :beers

  # Welcome
  # Please type your command. You can search or log a drink.
  # # Search
  # What would you like to search for? Type help to see the categories.
  # # By brewery

end
