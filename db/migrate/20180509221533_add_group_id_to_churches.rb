class AddGroupIdToChurches < ActiveRecord::Migration[5.1]
  def change
    add_column :churches, :group_id, :integer
  end
end
