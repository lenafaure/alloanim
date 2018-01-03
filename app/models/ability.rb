class Ability
  # Defines authorisations for User
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can [:update, :edit, :show, :matching_offers], User, :id => user.id
    cannot :read, Offer
  end
end
