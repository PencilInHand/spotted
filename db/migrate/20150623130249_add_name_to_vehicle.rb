class AddNameToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :name, :string
  end
end
