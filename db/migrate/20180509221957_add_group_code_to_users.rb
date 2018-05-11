class AddGroupCodeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :group_code, :string
  end
end
