class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
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
