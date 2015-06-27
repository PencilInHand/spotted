class ChangeVehicleYearFromDateToInteger < ActiveRecord::Migration
  def change
    remove_column :vehicles, :year, :date
    add_column :vehicles, :year, :integer
  end
end
