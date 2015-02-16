class AddVehicleRefToModifications < ActiveRecord::Migration
  def change
    add_reference :modifications, :vehicle, index: true
  end
end
