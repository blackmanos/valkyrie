class AdminAbility
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
      can :index, Role
    end
  end
end
