class CreateChurches < ActiveRecord::Migration[5.1]
  def change
    create_table :churches do |t|
      t.string :name

      t.timestamps
    end
  end
end
