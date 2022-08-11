class UsersController < ApplicationController

  def new

  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id
    flash[:success] = "Welcome, #{user.username}!"

    redirect_to '/'
  end

  def show
    # @user = User.find(session[:user_id]) # Have current_user now
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
