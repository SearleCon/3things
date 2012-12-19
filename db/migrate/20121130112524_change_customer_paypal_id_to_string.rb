class ChangeCustomerPaypalIdToString < ActiveRecord::Migration
  def up
    change_column :subscriptions, :customer_paypal_id, :string
  end

  def down
  end
end
