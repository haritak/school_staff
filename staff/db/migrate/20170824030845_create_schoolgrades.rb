class CreateSchoolgrades < ActiveRecord::Migration[5.1]
  def change
    create_table :schoolgrades do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
    add_index :schoolgrades, :code, unique: true
  end
end
