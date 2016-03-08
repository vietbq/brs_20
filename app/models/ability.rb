class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, Request
      can [:update, :destroy, :create], Review, user_id: user.id
      can :create, Comment
      can [:create, :destroy], Favorite
      can [:create, :destroy], UserBook
      can [:create, :destroy], Like
    end
  end
end
