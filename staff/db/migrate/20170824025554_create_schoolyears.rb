class CreateSchoolyears < ActiveRecord::Migration[5.1]
  def change
    create_table :schoolyears do |t|
      t.integer :startingyear

      t.timestamps
    end
    add_index :schoolyears, :startingyear, unique: true
  end
end
