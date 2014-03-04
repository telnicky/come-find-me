class Location < ActiveRecord::Base
  ##
  # Associations
  #
  belongs_to :user
  has_many :location_requests, :dependent => :destroy

  ##
  # Validations
  #
  validates_inclusion_of :longitude, :in => -180..180, :message => "Invalid value (-180..180)"
  validates_inclusion_of :latitude,  :in => -90..90, :message => "Invalid value (-90..90)"
end
