class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name, :email, :user_id, :password, :password_confirmation, profile_attributes: [:company_name,  :company_type,  :business,  :country,  :mobile_no]) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
    end
end
