class DeleteColumnNotifcationSmsPhoneFromPeople < ActiveRecord::Migration[5.1]
  def change
    remove_column :people, :notifcation_sms_phone
  end
end
