class AddCustomerPaypalIdToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :customer_paypal_id, :integer
  end
end
