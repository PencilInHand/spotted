class AddJsonColumnsToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :edmunds_json, :json
    add_column :vehicles, :custom_json, :json
  end
end
