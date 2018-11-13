class Beer < ActiveRecord::Base
  
  has_many :users, through: :beers
  belongs_to :style
  belongs_to :brewery
  has_many :hads

end
