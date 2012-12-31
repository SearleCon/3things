require "spec_helper"

describe AdminMailer do
  describe 'welcome' do
    let(:user)  { FactoryGirl.build(:user) }
    let(:mail)  { AdminMailer.welcome(user) }

    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == 'Welcome'
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == [user.email]
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == ['support@searleconsulting.co.za']
    end

  end

  def enquiry(message)
    @message = message
    mail to: "support@searleconsulting.co.za", subject: message.subject
  end

  describe 'enquiry' do
    let(:message) { FactoryGirl.build(:message) }
    let(:mail) { AdminMailer.enquiry(message) }

    #ensure that the subject is correct
    it 'renders the subject' do
      mail.subject.should == message.subject
    end

    #ensure that the receiver is correct
    it 'renders the receiver email' do
      mail.to.should == ['support@searleconsulting.co.za']
    end

    #ensure that the sender is correct
    it 'renders the sender email' do
      mail.from.should == [message.email]
    end

    #ensure that the @message variable appears in the email body
    it 'assigns @message' do
      mail.body.encoded.should match(message.name)
      mail.body.encoded.should match(message.email)
      mail.body.encoded.should match(message.subject)
      mail.body.encoded.should match(message.body)
    end
  end

end
