module Accessible
  extend ActiveSupport::Concern

  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_center
      redirect_to(users_path) && return
    elsif current_rhagent
        redirect_to(animateurs_path) && return
    elsif current_user
      redirect_to(user_path(current_user)) && return
    end
  end
end