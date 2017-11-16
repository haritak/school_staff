class CreateSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :settings do |t|
      t.belongs_to :school, foreign_key: true
      t.string :mng_email
      t.string :ypo1_email
      t.string :ypo2_email
      t.string :adeies_email

      t.timestamps
    end
  end
end
