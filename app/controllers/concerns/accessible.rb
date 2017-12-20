module Accessible
  extend ActiveSupport::Concern

  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_center
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(users_path) && return
    elsif current_rhagent
        # if you have rails_admin. You can redirect anywhere really
        redirect_to(rhagents_path) && return
    elsif current_user
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(user_path(current_user)) && return
    end
  end
end