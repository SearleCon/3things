class PlansController < ApplicationController
  respond_to :html
  before_filter :get_resource, :only => [:paypal_check_out]

  # GET /plans
  # GET /plans.json
  def index
    respond_with(@plans = Plan.all)
  end

  def paypal_check_out
    subscription = @plan.subscriptions.new
    subscription.user_id = current_user.id
    paypal = PaypalPayment.new(subscription)
    redirect_to paypal.checkout_url(
                    return_url: new_plan_subscription_url(@plan),
                    cancel_url: root_url, ipn_url: payment_notifications_url)
  end

  private
  def get_resource
    @plan = Plan.find(params[:id]) if params[:id]
  end
end

