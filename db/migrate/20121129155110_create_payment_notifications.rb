class CreatePaymentNotifications < ActiveRecord::Migration
  def change
    create_table :payment_notifications do |t|
      t.text :params
      t.integer :user_id
      t.integer :transaction_id
      t.string :status

      t.timestamps
    end
  end
end
