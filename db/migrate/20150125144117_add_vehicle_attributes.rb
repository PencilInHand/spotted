class AddVehicleAttributes < ActiveRecord::Migration
  def change
    add_column :vehicles, :vin, :string, null: false
    add_column :vehicles, :year, :date
    add_column :vehicles, :make, :string
    add_column :vehicles, :model, :string
    change_column_null :vehicles, :user_id, false
  end
end
