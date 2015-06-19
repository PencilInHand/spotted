class Image < ActiveRecord::Base
  belongs_to :vehicle

  has_one :user, through: :vehicle

  scope :belonging_to_user, ->(user_id) {
    vehicles = Vehicle.arel_table
    images = arel_table
    vehicle_ids = vehicles.where(vehicles[:user_id].eq(user_id)).
                       project(vehicles[:id])
    where(images[:vehicle_id].in(vehicles_ids))
  }
end
