class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter :user_activity

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firm
    devise_parameter_sanitizer.for(:sign_up) << :phone
    devise_parameter_sanitizer.for(:sign_up) << :info
    devise_parameter_sanitizer.for(:sign_up) << :site
  end

  private

  def user_activity
    current_user.try :touch
  end
end
