class CreateModifications < ActiveRecord::Migration
  def change
    create_table :modifications do |t|
      t.string :type
      t.string :manufacturer
      t.string :image_uri
      t.string :caption
      t.string :section

      t.timestamps null: false
    end
  end
end
