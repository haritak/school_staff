class ChangeTableLessonsForDeprecationSupport < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :deprecated, :bool, default: false
    add_column :lessons, :deprecated_reference, :string
  end
end
