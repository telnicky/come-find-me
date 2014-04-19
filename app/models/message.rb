class LocationRequest < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  belongs_to :location
  has_one :sender, :through => :location, :source => :user, :foreign_key => 'user_id'

  scope :by_user, lambda { |user| where(:user_id => user.id) }
  scope :by_updated_at, lambda { |date| where(:updated_at => date..Date.tomorrow) }

  ##
  # Validations
  #
  validates_presence_of :user, :location

  ##
  # Instance methods
  #
end
