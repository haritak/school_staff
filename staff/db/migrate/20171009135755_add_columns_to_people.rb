class AddColumnsToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :first_name_gen, :string
    add_column :people, :first_name_ait, :string
    add_column :people, :father_name_gen, :string
    add_column :people, :father_name_ait, :string
    add_column :people, :mother_name_gen, :string
    add_column :people, :mother_name_ait, :string
    add_column :people, :last_name_gen, :string
    add_column :people, :last_name_ait, :string
  end
end
