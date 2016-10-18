class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :date_of_birth, :phone_number, :avatar, :avatar_cache, role_ids:[]])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth, :phone_number, :avatar, :avatar_cache, role_ids: []])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :date_of_birth, :phone_number, :avatar, :avatar_cache, role_ids:[]])
  end

  #redirect after signin
  def after_sign_in_path_for(resource_or_scope)
    if !resource.provider.nil? && resource.roles.empty?
      flash[:success]= "Choose a Role"
      edit_user_registration_path(resource)
    elsif (resource.has_role? :student) && (resource.student_profile.nil?)
      flash[:success]= "Create a Student profile to get started."
      new_student_profile_path
    elsif (resource.has_role? :tutor) && (resource.tutor_profile.nil?)
      flash[:success]= "Create a Tutor profile to get started."
      new_tutor_profile_path
    else
      root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = exception.message
    redirect_to root_url
  end
end
