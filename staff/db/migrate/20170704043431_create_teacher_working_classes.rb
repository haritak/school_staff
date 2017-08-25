class CreateTeacherWorkingClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_working_classes do |t|
      t.string :description

      t.timestamps
    end
  end
end
