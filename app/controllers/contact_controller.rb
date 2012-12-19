class ContactController < ApplicationController
  before_filter :new_resource, :only => [:new,:create]

  def new
  end

  def create
    if @message.valid?
      AdminMailer.delay.enquiry(@message)
      redirect_to root_url, notice: 'Email was sent successfully'
    else
      render :new, alert: 'Please fill in all details'
    end
  end

  private
  def new_resource
    @message = Message.new(params[:message])
  end
end
