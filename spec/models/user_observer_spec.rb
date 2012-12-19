require 'spec_helper'

describe UserObserver, :subscription_observer do
   before(:each) do
     reset_emails
   end

  it 'should have a free trial and send a welcome mail after a user is created', observer: :subscription_observer do
     FactoryGirl.create(:plan, active: true, is_free: true)
     user = FactoryGirl.create(:user)
     observer = UserObserver.instance
     observer.after_create(user)
     user.subscriptions.count.should eq(1)
     Delayed::Worker.new.work_off
     last_email.to.should == [user.email]
  end


end
