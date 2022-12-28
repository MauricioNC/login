class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # Will render root path if the user wa successfully persisted in the DB
    redirect_to root_path, success: "User created succesfully" if @user.save

    # Will render new view if the user can't be persisted in the DB
    redirect_to new_user_path, error: @user.errors.full_messages unless @user.save
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password_digest)
  end
end
