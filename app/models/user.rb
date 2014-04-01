class User < ActiveRecord::Base

  ##
  # Associations
  #
  has_many :locations, :dependent => :destroy
  has_many :location_requests, :dependent => :destroy

  scope :by_updated_at, lambda { |date| where(:updated_at => date..Date.tomorrow) }

  ##
  # Validations
  #
  validates_uniqueness_of :email, :name
  validates_presence_of :email, :name
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates_format_of :phone_number, :with => /\A\d{3}-\d{3}-\d{4}\z/, :allow_blank => true

  ##
  # Instance Methods
  #
end
