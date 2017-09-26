class CreateRequestSpecifications < ActiveRecord::Migration[5.1]
  def change
    create_table :request_specifications do |t|
      t.string :request_type
      t.string :request_description
      t.text :request_spec_reference
      t.belongs_to :teacher_working_class, foreign_key: true
      t.string :template_filename

      t.timestamps
    end
  end
end
