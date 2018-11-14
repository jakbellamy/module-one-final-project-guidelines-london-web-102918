class UserBeer < ActiveRecord::Base

  belongs_to :user
  belongs_to :beer
  has_one :brewery, through: :beers
  has_one :style, through: :beers

end
