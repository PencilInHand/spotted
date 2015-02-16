class CreateTimeCards < ActiveRecord::Migration
  def change
    create_table :time_cards do |t|
      t.time :reaction_time
      t.time :sixty_foot_time
      t.time :three_thirty_foot_time
      t.time :eighth_mile_time
      t.string :eighth_mile_speed
      t.time :thousand_foot_time
      t.time :fourth_mile_time
      t.string :fourth_mile_speed

      t.timestamps null: false
    end
  end
end
