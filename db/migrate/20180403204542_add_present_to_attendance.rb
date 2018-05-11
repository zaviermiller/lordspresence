class AddPresentToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :present, :text, default: {}.to_yaml, array: true
  end
end
