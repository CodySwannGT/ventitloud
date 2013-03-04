class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, User
      can :update, User, :id => user.id
      
      can :read, Vent, :user_id => user.id
      can :create, Vent
      
      can :create, Share
    end
  end
end
