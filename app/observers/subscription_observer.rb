class SubscriptionObserver < ActiveRecord::Observer

  def before_create(subscription)
    plan = Plan.find(subscription.plan_id)
    subscription.expiry_date = Time.now + plan.duration.months
    subscription.active = true
    unless plan.is_free
      paypal = PaypalPayment.new(subscription)
      response = paypal.request_payment
      response.approved? && response.success?
    end

  end

end
