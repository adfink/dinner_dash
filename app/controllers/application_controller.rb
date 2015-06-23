class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :cart_loader
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin
    current_user && current_user.admin?
  end

  def not_found
    render file: "public/404"
  end

  private

  def cart_loader
    @cart = Cart.new(session[:cart])
  end
end
