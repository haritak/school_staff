class CreateSchoolStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :school_students do |t|
      t.belongs_to :school, foreign_key: true
      t.belongs_to :student, foreign_key: true
      t.integer :registry_no

      t.timestamps
    end
  end
end
