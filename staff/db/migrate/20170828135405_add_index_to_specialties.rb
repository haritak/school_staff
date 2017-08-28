class AddIndexToSpecialties < ActiveRecord::Migration[5.1]
  def change
    add_index :specialties, :code, unique: true
  end
end
