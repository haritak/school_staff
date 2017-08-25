class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :code
      t.string :title
      t.string :email

      t.timestamps
    end
    add_index :schools, :code, unique: true
    add_index :schools, :email, unique: true
  end
end
