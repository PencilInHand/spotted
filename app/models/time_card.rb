class TimeCard < ActiveRecord::Base
  belongs_to :vehicle

  validates :vehicle, presence: true
end
