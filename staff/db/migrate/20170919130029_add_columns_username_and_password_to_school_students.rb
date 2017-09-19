class AddColumnsUsernameAndPasswordToSchoolStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :school_students, :username, :string
    add_column :school_students, :password, :string
  end
end
