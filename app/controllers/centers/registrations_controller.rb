class Centers::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, only: [:edit, :update, :destroy]
  before_action :configure_sign_up_params, only: [:create, :update]
  # before_action :configure_account_update_params, only: [:update]

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end


  protected
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :phone_number, :password, :password_confirmation, :circonscription])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :circonscription])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
