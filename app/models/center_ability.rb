class CenterAbility
  include CanCan::Ability

  def initialize(center)
    center ||= Center.new # guest user (not logged in)
    can :read, User
    can :show, Center, :id => center.id
    cannot :update, User
  end
end
