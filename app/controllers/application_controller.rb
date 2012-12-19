class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :subscription_required

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  def render_not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  private
  def after_sign_out_path_for(resource_or_scope)
    if current_user
      new_suggestion_url
    else
      root_url
    end
  end

  def subscription_required
    unless current_user.nil?
      if current_user.subscriptions.empty? || current_user.subscriptions.first.has_expired?
        redirect_to plans_url
      end
    end
  end

end
