class AddVehicleRefToTimeCard < ActiveRecord::Migration
  def change
    add_reference :time_cards, :vehicle, index: true
  end
end
