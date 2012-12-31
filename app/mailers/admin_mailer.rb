class AdminMailer < ActionMailer::Base
  default from: "support@searleconsulting.co.za" # Change to your app name here

  def welcome(user)
    @user = user
    mail from: 'support@searleconsulting.co.za', to: @user.email, subject: "Welcome"
  end

  def enquiry(message)
    @message = message
    mail to: "support@searleconsulting.co.za", subject: message.subject, from: message.email
  end

end
