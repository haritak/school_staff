class CreateSchoolClassLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :school_class_lessons do |t|
      t.belongs_to :school_class, foreign_key: true
      t.belongs_to :lesson, foreign_key: true

      t.timestamps
    end
  end
end
