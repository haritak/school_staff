class CreateStudentContactInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :student_contact_infos do |t|
      t.belongs_to :student, foreign_key: true
      t.text :info
      t.string :type

      t.timestamps
    end
  end
end
