class AddNotNullToUserNameAndEmail < ActiveRecord::Migration
  def change
    change_column_null :users, :name, false, nil
    change_column_null :users, :email, false, nil
  end
end
