class Modification < ActiveRecord::Base
  belongs_to :vehicle
  has_one :user, through: :vehicle

  validates :vehicle, presence: true

  scope :belonging_to_user, ->(user_id) {
    vehicles = Vehicle.arel_table
    modifications = arel_table
    vehicle_ids = vehicles.where(vehicles[:user_id].eq(user_id)).
                       project(vehicles[:id])
    where(modifications[:vehicle_id].in(vehicle_ids))
  }

  def initialize(args=nil)
    # Abstract class for the two modifications that inherit this class.
    raise "Cannot directly instantiate an AbstractUser" if self.class == Modification
    super
  end
end
