class RhagentAbility
  include CanCan::Ability

  def initialize(rhagent)
    rhagent ||= Rhagent.new # guest user (not logged in)
    can :read, Offer
    can :manage, User
    can :show, Rhagent, :id => rhagent.id
    can :manage, Rhagent
    cannot :manage, School
    cannot :manage, Circonscription
    cannot :manage, Diploma
    cannot :manage, Center
  end
end
