class CenterAbility
  include CanCan::Ability

  def initialize(center)
    center ||= Center.new # guest user (not logged in)
    can :manage, Offer
    can :read, User
    can :read, School
    can :show, Center, :id => center.id
    can :manage, Center
    cannot :manage, Circonscription
    cannot :manage, Diploma
    cannot :manage, Rhagent
  end
end
