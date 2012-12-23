class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def after_sign_in_path_for(resource)
    users_path
  end

  def authenticate_user!(opts={})
    if current_user.blank?
      redirect_to root_path
    end
  end
end
