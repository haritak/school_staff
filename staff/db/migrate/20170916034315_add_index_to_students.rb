class AddIndexToStudents < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :first_name, :string, default: "", null: false
    change_column :students, :last_name, :string, default: "", null: false
    change_column :students, :father_name, :string, default: "", null: false
    change_column :students, :mother_name, :string, default: "", null: false
    add_index :students,
      [:first_name, :last_name, :father_name, :mother_name],
      unique: true,
      name: "uniqness_in_students"
  end
end
