class Friendship < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  belongs_to :friend, :class_name => 'User'

  scope :by_user, lambda { |user|
    where(arel_table[:user_id].eq(user.id)
            .or(arel_table[:friend_id].eq(user.id)))
  }

  scope :by_updated_at, lambda { |date| where(:updated_at => date..Date.tomorrow) }

  ##
  # Validations
  #
  validates_uniqueness_of :friend_id, :scope => :user_id, :message => "Relationship already exists"
  validates_presence_of :friend, :user
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
