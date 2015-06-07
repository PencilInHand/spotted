class Image < ActiveRecord::Base
  belongs_to :vehicles
  belongs_to :modifications
  belongs_to :time_cards
end
