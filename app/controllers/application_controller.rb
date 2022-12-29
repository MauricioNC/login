class ApplicationController < ActionController::Base
  add_flash_types :info, :success, :warning, :error

  before_action :require_login, :current_user

  def require_login
    redirect_to login_path if session[:user_id].nil?
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end
end
