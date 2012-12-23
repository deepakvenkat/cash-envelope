class UsersController < ApplicationController

  before_filter :authenticate_user!
  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes!(params[:user])
      flash[:alert] = "Updated"
    else
      flash[:error] = @user.errors
    end
    redirect_to user_path
  end
end
