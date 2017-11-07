class CenterAbility
  include CanCan::Ability

  def initialize(center)
    center ||= Center.new # guest user (not logged in)
    can :read, User
    can :manage, Offer #remove asap
    can :show, Center, :id => center.id
    can :manage, Center
    cannot :update, User
  end
end
