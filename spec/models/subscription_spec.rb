require 'spec_helper'

describe Subscription do
  pending "add some examples to (or delete) #{__FILE__}"
end
# == Schema Information
#
# Table name: subscriptions
#
#  id                 :integer         not null, primary key
#  plan_id            :integer
#  user_id            :integer
#  active             :boolean         default(FALSE)
#  expiry_date        :date
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  customer_paypal_id :string(255)
#

