class RenameColumnRequestTypeToCodeInRequestSpecificationsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :request_specifications, :request_type, :code
    rename_column :request_specifications, :request_description, :description
    rename_column :request_specifications, :request_spec_reference, :spec_reference
  end
end
