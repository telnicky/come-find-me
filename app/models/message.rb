class Message < ActiveRecord::Base
  ##
  # Associations
  #
  has_many :broadcasts
  belongs_to :user
  belongs_to :location
  belongs_to :sender, :class_name => "User"

  scope :unread_messages_by_user, lambda { |user|
    where(:user_id => user.id, :read => false)
  }

  scope :by_user, lambda { |user|
    where(arel_table[:user_id].eq(user.id)
          .or(arel_table[:sender_id].eq(user.id)))
    .order(:created_at => :desc)
  }

  scope :by_updated_at, lambda { |date| where(:updated_at => date..Date.tomorrow) }

  ##
  # Validations
  #
  validates_presence_of :user, :location, :sender

  ##
  # Instance methods
  #
  def receivers
    user_ids = Message.where(:sender_id => sender.id, :location_id => location.id).pluck(:user_id)
    User.where(:id => user_ids)
  end
end
