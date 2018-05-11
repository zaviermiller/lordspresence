class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.references :church, foreign_key: true

      t.timestamps
    end
  end
end
