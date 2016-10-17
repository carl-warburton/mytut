class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  # use growlyflash
  use_growlyflash

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :date_of_birth, :phone_number, :avatar, :avatar_cache, role_ids:[]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :phone_number, :avatar, :avatar_cache, role_ids: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :phone_number, :avatar, :avatar_cache, role_ids:[]])
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
