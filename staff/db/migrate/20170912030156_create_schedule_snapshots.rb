class CreateScheduleSnapshots < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_snapshots do |t|
      t.integer :save_no
      t.text :description

      t.timestamps
    end
  end
end
