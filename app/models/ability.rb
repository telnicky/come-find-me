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

      # Messages
      can :create, Message
      can :read, Message, :user_id => user.id
      can :read, Message, :sender_id => user.id
      can :destroy, Message, :user_id => user.id
      can :destroy, Message, :sender_id => user.id
      can :update, Message, :user_id => user.id

      # sync
      can :read, :sync

      # Broadcasts
      can :create, Broadcast, :sender_id => user.id
      can :read, Broadcast, :user_id => user.id
      can :read, Broadcast, :sender_id => user.id
      can :destroy, Broadcast, :sender_id => user.id
      can :message_broadcasts, Broadcast, :user_id => user.id
    end
  end
end
