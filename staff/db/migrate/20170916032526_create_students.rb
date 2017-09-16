class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.string :father_name
      t.string :mother_name

      t.timestamps
    end
  end
end
