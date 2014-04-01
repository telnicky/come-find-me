class Ability
  include CanCan::Ability

  def initialize(user)

    # User
    can :create, User

    if user.present?
      # User
      can :read, User, :id => user.id
      can :update, User, :id => user.id
      can :destroy, User, :id => user.id

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

      # sync
      can :read, :sync
    end
  end
end
