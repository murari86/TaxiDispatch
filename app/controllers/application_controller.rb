class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  layout Proc.new { |controller| controller.devise_controller? ? 'user_account' : 'application' }

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_no, :country, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :phone_no, :country, :email, :password, :password_confirmation) }

  end
end
