class Location < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  has_many :messages, :dependent => :destroy

  scope :by_user, lambda { |user| where(:user_id => user.id) }
  scope :by_updated_at, lambda { |date| where(:updated_at => date..Date.tomorrow) }

  ##
  # Validations
  #
  validates_presence_of :user, :longitude, :latitude
  validates_inclusion_of :longitude, :in => -180..180, :message => "Invalid value (-180..180)"
  validates_inclusion_of :latitude,  :in => -90..90, :message => "Invalid value (-90..90)"
end
