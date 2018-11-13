
class Brewery < ActiveRecord::Base
    has_many :beers
    has_many :styles, through :beers
    has_many :hads, through :beers
    has_many :users, through :beers
end