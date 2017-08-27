class AddReferenceToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :reference, :string
  end
end
