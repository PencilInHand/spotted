class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :modifications
  has_one :time_card

  validates :user, presence: true
  validates :vin, uniqueness: true
end
