class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_language
  after_filter :user_activity


  rescue_from ActiveRecord::RecordNotFound, with: :page_not_found

  def page_not_found
    respond_to do |format|
      format.html { render file: 'errors/404', status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

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

  def store_location
    session[:return_to] = request.request_uri
  end
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def set_language
    if session[:language].blank? or session[:language].to_sym != I18n.locale
      session[:language] = 'ru' if session[:language].blank?
      session[:language] = (['ru', 'en'].include? session[:language]) ? session[:language] : 'ru'
      I18n.locale =  session[:language].to_sym
    end
  end
end
