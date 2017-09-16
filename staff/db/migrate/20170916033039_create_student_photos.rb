class CreateStudentPhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :student_photos do |t|
      t.belongs_to :student, foreign_key: true
      t.string :filename
      t.string :type

      t.timestamps
    end
  end
end
