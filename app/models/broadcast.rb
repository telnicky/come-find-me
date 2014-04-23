class Broadcast < ActiveRecord::Base

  ##
  # Associations
  #
  belongs_to :user
  belongs_to :message
  belongs_to :sender, :class_name => "User"

  ##
  # Scopes
  #
  scope :by_user, lambda { |user| where(:user_id => user.id) }
  scope :by_message_id, lambda { |message_id|
    where(:message_id => message_id)
  }

  ##
  # Validations
  #
  validates_presence_of :user, :message, :sender


end
