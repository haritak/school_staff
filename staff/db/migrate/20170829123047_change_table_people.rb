class ChangeTablePeople < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :first_name, :string, default: "", null: false
    change_column :people, :last_name, :string, default: "", null: false
    change_column :people, :father_name, :string, default: "", null: false
    change_column :people, :mother_name, :string, default: "", null: false
  end
end
