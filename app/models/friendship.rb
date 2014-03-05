class Friendship < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  ##
  # Validations
  #
  validates_uniqueness_of :friend_id, :scope => :user_id, :message => "Relationship already exists"
  validate :inverse_friendship_not_present?
  validate :cant_friend_yourself

  def inverse_friendship_not_present?
    if Friendship.where(:user_id => friend_id, :friend_id => user_id).present?
      errors.add(:friend_id, "Inverse relationship already exists")
    end
  end

  def cant_friend_yourself
    if user_id == friend_id
      errors.add(:friend_id, "Can't friend yourself")
    end
  end
end
