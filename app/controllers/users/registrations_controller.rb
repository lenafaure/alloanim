class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, only: [:edit, :update, :destroy]
  before_action :configure_sign_up_params, only: [:create, :update]

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :soi_number, :phone_number, :circonscription, :password, :password_confirmation])
  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :email, :password, :password_confirmation, :phone_number, :soi_number, :diploma, :circonscription, :school, :avatar])
  end

  # redirect to edit page after sign up
  def after_sign_up_path_for(resource)
    edit_user_registration_path(current_user)
  end

  # redirect to show page after profile update
  def after_update_path_for(resource)
    user_path(current_user)
  end

end
