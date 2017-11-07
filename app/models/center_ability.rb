class CenterAbility
  include CanCan::Ability

  def initialize(center)
    center ||= Center.new # guest user (not logged in)
    can :manage, User
    can :manage, Offer #remove asap
    can :show, Center, :id => center.id
    can :manage, Center
  end
end
