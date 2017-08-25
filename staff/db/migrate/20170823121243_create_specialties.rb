class CreateSpecialties < ActiveRecord::Migration[5.1]
  def change
    create_table :specialties do |t|
      t.string :code, null: false, unique: true
      t.text :description

      t.timestamps
    end
  end
end
