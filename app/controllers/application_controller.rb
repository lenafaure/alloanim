class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any action performed by this controller, verify if the user is authenticated
  before_action :authenticate_user!, :except => [:pages, :home]

  def after_sign_in_path_for(resource)
    edit_user_path(current_user)
  end
end
