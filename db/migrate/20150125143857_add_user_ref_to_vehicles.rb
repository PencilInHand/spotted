class AddUserRefToVehicles < ActiveRecord::Migration
  def change
    add_reference :vehicles, :user, index: true
    add_foreign_key :vehicles, :users
  end
end
