class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.belongs_to :person, index: {:unique=>true}, foreign_key: true
      t.belongs_to :school, foreign_key: true
      t.date :date_in_school
      t.date :date_employed

      t.timestamps
    end
  end
end
