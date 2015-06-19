class RemoveImageUriFromModifications < ActiveRecord::Migration
  def change
    remove_column :modifications, :image_uri, :string
  end
end
