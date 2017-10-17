class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before any action performed by this controller, verify if the user is authenticated
  devise_group :person, contains: [:user, :center]
  before_action :authenticate_person!, :except => [:pages, :home]
  before_action :offers_notification

  def offers_notification
    @offers = Offer.all.order(:date).where('date >= ?', DateTime.now.to_date)
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
