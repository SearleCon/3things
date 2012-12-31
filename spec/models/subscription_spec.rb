require 'spec_helper'

describe Subscription do
  it "has a valid factory" do
    FactoryGirl.create(:subscription).should be_valid
  end

  it "is invalid without a plan" do
    FactoryGirl.build(:subscription, plan_id: nil).should_not be_valid
  end

  it "is invalid without a customer_paypal_id" do
    FactoryGirl.build(:subscription, customer_paypal_id: nil).should_not be_valid
  end
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

