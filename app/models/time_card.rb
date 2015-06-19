class TimeCard < ActiveRecord::Base
  belongs_to :vehicle
  has_one :user, through: :vehicle

  validates :vehicle, presence: true

  scope :belonging_to_user, ->(user_id) {
    vehicles = Vehicle.arel_table
    time_cards = arel_table
    vehicle_ids = vehicles.where(vehicles[:user_id].eq(user_id)).
                       project(vehicles[:id])
    where(time_cards[:vehicle_id].in(vehicle_ids))
  }
end
