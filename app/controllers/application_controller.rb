class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :set_xhr_flash

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def routing_error
    raise ActionController::RoutingError.new(params[:path])
  end

  def render_not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

  def set_xhr_flash
    flash.discard if request.xhr?
  end

  private
  def after_sign_in_path_for(resource)
    if current_user.subscriptions.empty? || current_user.subscriptions.first.has_expired?
       plans_url
    else
      root_url
    end

  end


  def after_sign_out_path_for(resource_or_scope)
    if current_user
      new_suggestion_url
    else
      root_url
    end
  end

end
