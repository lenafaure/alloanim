class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any action performed by this controller, verify if the user is authenticated
  before_action :authenticate_user!, :except => [:pages, :home]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # redirect to edit page after sign in
  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  # allow additional parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :phone_number, :soi_number, :circonscription, :school])
  end

end
