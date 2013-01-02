require "spec_helper"

describe BillingMailer do
  describe 'subscription_activated' do
    let(:user) { FactoryGirl.create(:user) }
    let(:subscription)  { FactoryGirl.build(:subscription, :user => user) }
    let(:mail)  { BillingMailer.subscription_activated(subscription) }

    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'Subscription activated'
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ['billing@searleconsulting.co.za']
    end

    #ensure that the @user variable appears in the email body
    it 'assigns @user' do
      mail.body.encoded.should match(user.name)
    end

    #ensure that the @subscription variable appears in the email body
    it 'assigns @subscription' do
      mail.body.encoded.should match(subscription.customer_paypal_id)
    end

  end
  describe 'payment_received' do
    let(:user) { FactoryGirl.create(:user) }
    let(:subscription)  { FactoryGirl.build(:subscription, :user => user) }
    let(:mail)  { BillingMailer.payment_received(subscription) }

    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'Thank you for your payment'
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ['billing@searleconsulting.co.za']
    end

    #ensure that the @user variable appears in the email body
    it 'assigns @user' do
      mail.body.encoded.should match(user.name)
    end

    #ensure that the @subscription variable appears in the email body
    it 'assigns @subscription' do
      mail.body.encoded.should match(subscription.customer_paypal_id)
    end

  end
  describe 'paypal_error' do
    let(:user) { FactoryGirl.create(:user) }
    let(:subscription)  { FactoryGirl.create(:subscription, :user => user) }
    let(:payment_notification) { FactoryGirl.create(:payment_notification) }
    let(:mail)  { BillingMailer.paypal_error(subscription, payment_notification) }

    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == "Paypal error: Notification #{payment_notification.id}"
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == ['billing@searleconsulting.co.za']
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ['billing@searleconsulting.co.za']
    end

    #ensure that the @user variable appears in the email body
    it 'assigns @user' do
      mail.body.encoded.should match(user.name)
    end

    #ensure that the @subscription variable appears in the email body
    it 'assigns @subscription' do
      mail.body.encoded.should match(subscription.id.to_s)
    end

    #ensure that the @notification variable appears in the email body
    it 'assigns @notification' do
      mail.body.encoded.should match(payment_notification.id.to_s)
    end

  end
end
