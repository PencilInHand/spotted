class Image < ActiveRecord::Base
  belongs_to :vehicles
  belongs_to :modifications
end
