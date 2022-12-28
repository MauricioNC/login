class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:login, :create]

  def login
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to '/login', error: @user.errors.full_messages
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
