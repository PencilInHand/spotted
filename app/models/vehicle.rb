class Vehicle < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :vin, presence: true, uniqueness: true
end
