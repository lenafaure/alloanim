class RegistrationsController < Devise::RegistrationsController

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # redirect to show page after profile update
  def after_update_path_for(resource)
    user_path(current_user)
  end

end