class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any action performed by this controller, verify if the user is authenticated
  devise_group :person, contains: [:user, :center]
  before_action :authenticate_person!, :except => [:pages, :home]
  before_action :matching_notification, :except => [:pages, :home]

  def matching_notification
     if user_signed_in?
        @matches = User.offer_matches(current_user)
     end
  end

  # Define authorization for multiple types of users
  def current_ability
    if user_signed_in?
      @current_ability ||= Ability.new(current_user)
    else
      @current_ability ||= CenterAbility.new(current_center)
    end
  end



end
