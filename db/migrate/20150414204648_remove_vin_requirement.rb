class RemoveVinRequirement < ActiveRecord::Migration
  def change
    change_column :vehicle, :vin, null: true
  end
end
