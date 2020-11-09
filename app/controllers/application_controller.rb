class ApplicationController < ActionController::Base
  before_action :configure_pamitted_parameters, if: :devise_controller?

  private

  def configure_pamitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
