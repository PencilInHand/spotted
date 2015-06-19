class AddVehicleIdToImages < ActiveRecord::Migration
  def change
    add_reference :images, :vehicle, index: true
  end
end
