class LocationRequest < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  belongs_to :location
  has_one :sender, :through => :location, :source => :user, :foreign_key => 'user_id'

  ##
  # Validations
  #
  validate :sender_is_friend

  ##
  # Instance methods
  #
  def sender_is_friend
    unless user.has_friend?(sender)
      errors.add(:user_id, "is not a friend of sender")
    end
  end
end
