class RemoveVinRequirement < ActiveRecord::Migration
  def change
    change_column :vehicles, :vin, :string, null: true
  end
end
