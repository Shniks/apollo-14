class UsersController < ApplicationController

  def new

  end

  def create
    user = User.create!(user_params)
    flash[:success] = "Welcome, #{user.username}!"

    redirect_to '/'
  end

  private

  def user_params
    params.permit(:username, :password)
  end

end
