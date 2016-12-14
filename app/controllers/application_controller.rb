class ApplicationController < ActionController::API



  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:user, keys: [:email, :password, :password_confirmation, :phone, :address, :name_company])
  end
end
