class AddSubModelToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :sub_model, :string
  end
end
