class ApplicationController < ActionController::Base
  protect_from_forgery

  layout proc{ |c| c.request.xhr? ? false : "application" }

  before_filter :correct_ajax_headers
  after_filter  :set_xhr_flash


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
  def after_sign_in_path_for(resource)
    if current_user.subscriptions.empty? || current_user.subscriptions.first.has_expired?
       plans_url
    else
      root_url
    end

  end


  def after_sign_out_path_for(resource_or_scope)
      new_suggestion_url
  end

  #Ajax specific methods
  def set_xhr_flash
    flash.discard if request.xhr?
  end

  def correct_ajax_headers
    ajax_request_types = %w(text/javascript application/json text/xml)
    request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 } if request.xhr?
  end



end
