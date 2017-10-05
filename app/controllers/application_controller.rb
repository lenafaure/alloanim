class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any action performed by this controller, verify if the user is authenticated
  before_action :authenticate!, :except => [:pages, :home]
  before_action :configure_permitted_parameters, if: :devise_controller?



  # allow additional parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birthday, :email, :password, :password_confirmation, :phone_number, :soi_number, :circonscription, :school, :avatar])
  end

  def authenticate!
    if current_user != nil
      :authenticate_user!
    else
      :authenticate_center
    end
  end

end
