class ChangeTableClassesForDeprecationSupport < ActiveRecord::Migration[5.1]
  def change
    add_column :school_classes, :deprecated, :bool, default: false
    add_column :school_classes, :deprecated_reference, :string
  end
end
