class User < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:auth_token) }

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
  validates_format_of :phone_number, :with => /\A\d{3}-\d{3}-\d{4}\z/

  ##
  # Instance Methods
  #
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
end
