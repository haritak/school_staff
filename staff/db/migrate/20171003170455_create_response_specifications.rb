class CreateResponseSpecifications < ActiveRecord::Migration[5.1]
  def change
    create_table :response_specifications do |t|
      t.belongs_to :request_specification, foreign_key: true
      t.string :template_filename

      t.timestamps
    end
  end
end
