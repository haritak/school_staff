class AddGenderToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :gender, :integer, default: 1
  end
end
