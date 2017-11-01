class AddIndexToRequestSpecifications < ActiveRecord::Migration[5.1]
  def change
    add_index :request_specifications, [:code, :teacher_working_class_id], 
      unique: true, name: "request_specifications_uniqness"
  end
end
