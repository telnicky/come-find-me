class Ability
  include CanCan::Ability

  def initialize(user)

    # User
    can :create, User

    if user.present?
      # User
      can :search, User
      can :read, User, :friendships => { :user_id => user.id, :accepted => true }
      can :read, User, :friendships => { :friend_id => user.id, :accepted => true }
      can :update, User, :id => user.id
      can :destroy, User, :id => user.id

      # Friendship
      can :create, Friendship, :user_id => user.id
      can :read, Friendship, :user_id => user.id
      can :read, Friendship, :friend_id => user.id
      can :update, Friendship, :friend_id => user.id, :accepted => false
      can :destroy, Friendship, :user_id => user.id
      can :destroy, Friendship, :friend_id => user.id

      # Location
      can :create, Location, :user_id => user.id
      can :read, Location, :user_id => user.id
      can :update, Location, :user_id => user.id
      can :destroy, Location, :user_id => user.id

      # Location Requests
      can :read, LocationRequest, :user_id => user.id
      can :read, LocationRequest, :location => { :user_id => user.id }
      can :destroy, LocationRequest, :user_id => user.id
      can :destroy, LocationRequest, :location => { :user_id => user.id }
      can :create, LocationRequest
    end
  end
end