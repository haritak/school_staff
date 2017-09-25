class AddColumnsMobilePhoneHomeAddressToPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :mobile_phone, :string
    add_column :people, :home_address, :string
  end
end
