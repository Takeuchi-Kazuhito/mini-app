class ApplicationController < ActionController::Base

  #before_filterを設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :unique_id])
    end
end
