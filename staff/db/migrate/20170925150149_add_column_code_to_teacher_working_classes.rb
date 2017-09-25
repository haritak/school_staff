class AddColumnCodeToTeacherWorkingClasses < ActiveRecord::Migration[5.1]
  def change
    add_column :teacher_working_classes, :code, :string, null: false, default: ""
    add_index :teacher_working_classes, :code, unique: true
  end
end
