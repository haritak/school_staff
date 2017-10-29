class CreateDecisionFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :decision_files do |t|
      t.belongs_to :school_teacher_response, foreign_key: true
      t.string :filename
      t.string :target

      t.timestamps
    end
  end
end
