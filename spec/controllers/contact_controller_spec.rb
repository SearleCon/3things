require 'spec_helper'

describe ContactController do

  before(:each) do
    @attr = {
        :name => "Example User",
        :email => "user@example.com",
        :subject => "subject",
        :body => "body"
    }

    reset_emails
  end

  describe "GET 'new'" do
    it "should assign a new instance of message to @message" do
      get :new, { :message => @attr }
      assigns(:message).should be_a(Message)
    end
  end

  describe "POST 'create'" do
    it "should send an email to support" do
      post :create, {:message => @attr}
      Delayed::Worker.new.work_off
      last_email.to.should == ["support@searleconsulting.co.za"]
    end

    it "should redirect to the home page on success" do
      post :create, { :message => @attr }
      response.should redirect_to(root_url)
    end
  end

end
