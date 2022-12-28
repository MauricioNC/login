class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    raise @user.errors.full_messages unless @user.save

    session[:user_id] = @user.id

    # Will render root path if the user wa successfully persisted in the DB
    redirect_to root_path, success: "User created succesfully"
  rescue => e
    # Will render new view if the user can't be persisted in the DB
    redirect_to new_user_path, error: e
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password_digest)
  end
end
