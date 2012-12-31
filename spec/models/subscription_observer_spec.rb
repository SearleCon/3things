require 'spec_helper'

describe SubscriptionObserver do
  it 'should have an active subscription' do
    plan = FactoryGirl.create(:plan, active: true, is_free: true)
    subscription = FactoryGirl.create(:subscription, :plan => plan)
    observer = SubscriptionObserver.instance
    observer.before_create(subscription)
    subscription.active.should eq(true)
    subscription.expiry_date.should eq(Date.today + plan.duration.months)
  end
end
