class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any action performed by this controller, verify if the user is authenticated
  devise_group :person, contains: [:user, :center, :rhagent, :admin_user]
  before_action :authenticate_person!, :except => [:pages, :home]
  before_action :matching_notification, :except => [:pages, :home]
  before_action :completed_profile

  # Display matching notifications in navigation
  def matching_notification
     if user_signed_in?
        @matches = User.offer_matches(current_user)
     end
  end

  # Define authorization for multiple types of users
  def current_ability
    if user_signed_in?
      @current_ability ||= Ability.new(current_user)
    elsif center_signed_in?
      @current_ability ||= CenterAbility.new(current_center)
    elsif rhagent_signed_in?
      @current_ability ||= RhagentAbility.new(current_rhagent)
    end
  end

  # Prevent user sign in if profile not complete
  def completed_profile
    if user_signed_in?
      if (current_user.soi_number.blank? || current_user.phone_number.blank? || current_user.diploma.blank?)
        redirect_to edit_user_path(current_user), alert: "Votre profil doit être complété"
      end
    end
  end

end
