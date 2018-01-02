class RhagentAbility
  include CanCan::Ability

  def initialize(rhagent)
    rhagent ||= Rhagent.new # guest user (not logged in)
    can :read, Offer
    can :read, School
    can :manage, User
    can :show, Rhagent, :id => rhagent.id
    cannot :manage, Circonscription
    cannot :manage, Diploma
    cannot :manage, Center
  end
end
