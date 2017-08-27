class CreateLessonTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_types do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
    add_index :lesson_types, :code, unique: true
  end
end
