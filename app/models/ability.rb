class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # if user.has_role? :admin
    #   can :manage, :all
    # else
      can :read, Vent
      unless user.new_record?
        can :read, User
        can :update, User, :id => user.id
      
        #, :user_id => user.id
        can :create, Vent
        can :vote_on, Vent
        can :destroy, Vent, :user_id => user.id
      
        can :create, Share
        can :create, Comment
        can :create, ActsAsVotable::Vote
      end
    # end
  end
end
