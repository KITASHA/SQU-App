class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :devise_controller?
  before_action :basic_auth, if: :parts_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def reset_all
    if params[:password] == ENV['BASIC_AUTH_PASSWORD_SQUARE']
      head :ok
      Part.delete_all
      Song.delete_all
    else
      head :forbidden
    end
  end

  private
  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER_SQUARE'] && password == ENV['BASIC_AUTH_PASSWORD_SQUARE']
    end
  end
end
