class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  def after_sign_in_path_for(resource)
    '/users/'+current_user.id.to_s
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def authenticate_user!(opts={})
    if current_user.blank?
      redirect_to root_path
    end
  end
end
