class StaticPagesController < ApplicationController

  #cache static pages without layout, caching is turned off by default in development mode, to turn on use  config.action_controller.perform_caching = true in development.rb under environments
  caches_action :faq, :about, :terms_and_conditions, :privacy_policy, :pricing, :layout => false

  def about
  end

  def faq
  end

  def privacy_policy
  end

  def terms_and_conditions
  end

  def pricing
  end
end
