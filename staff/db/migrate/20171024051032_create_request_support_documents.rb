class CreateRequestSupportDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :request_support_documents do |t|
      t.belongs_to :school_teacher_request, foreign_key: true
      t.integer :order
      t.string :issuer
      t.string :issuer_protocol
      t.date :issuer_date
      t.string :description

      t.timestamps
    end
  end
end
