class AddColumnSerialNoToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :serial_no, :string, unique: true
  end
end
