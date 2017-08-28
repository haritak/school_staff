class CreateSchoolClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :school_classes do |t|
      t.belongs_to :schoolyear, foreign_key: true
      t.belongs_to :school, foreign_key: true
      t.belongs_to :school_grade_specialty, foreign_key: true
      t.integer :number
      t.integer :capacity

      t.timestamps
    end
  end
end
