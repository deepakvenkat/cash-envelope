class UsersController < ApplicationController

  def show
    authenticate_user!
    @user = current_user
  end

  def update
    current_user.update_attributes(params[:user])
    render nothing: true
  end
end
