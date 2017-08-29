class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :father_name
      t.string :mother_name
      t.string :notification_email
      t.string :notifcation_sms_phone

      t.timestamps
    end
  end
end
