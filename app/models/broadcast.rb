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
  scope :by_message_id, lambda { |message_id|
    where(:message_id => message_id)
  }

  scope :by_user, lambda { |user|
    where(arel_table[:user_id].eq(user.id)
          .or(arel_table[:sender_id].eq(user.id)))
    .order(:created_at => :desc)
  }

  ##
  # Validations
  #
  validates_presence_of :user, :message, :sender
  validates_uniqueness_of :user_id, :scope => [ :message_id, :sender_id ]


end
