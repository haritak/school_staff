class AddIndexToPeople < ActiveRecord::Migration[5.1]
  def change
    add_index :people,
      [:first_name, :last_name, :father_name, :mother_name],
      unique: true,
      name: "uniqness_in_people"
  end
end
