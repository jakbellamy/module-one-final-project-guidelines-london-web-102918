class Brewery < ActiveRecord::Base
    has_many :beers
    has_many :styles, through: :beers
    has_many :user_beers, through: :beers
    has_many :users, through: :beers
end
