class User < ActiveRecord::Base

  ##
  # Associations
  #
  has_many :locations, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :sent_messages, :dependent => :destroy, :foreign_key => :sender_id

  scope :by_updated_at, lambda { |date| where(:updated_at => date..Date.tomorrow) }

  ##
  # Validations
  #
  validates_uniqueness_of :email, :name, :allow_blank => true
  validates_uniqueness_of :facebook_id
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, :allow_blank => true
  validates_format_of :phone_number, :with => /\A\d{3}-\d{3}-\d{4}\z/, :allow_blank => true
  validates_presence_of :facebook_id
  validate :facebook_access_token_matches_facebook_id

  ##
  # Instance Methods
  #
  def authenticate(access_token)
    return false if access_token.blank?
    return true if self.facebook_access_token.present? && access_token == self.facebook_access_token

    if facebook_access_token_matches_facebook_id?(access_token)
      self.facebook_access_token = access_token
      self.save
    else
      false
    end
  end

  def facebook_access_token_matches_facebook_id
    unless facebook_access_token_matches_facebook_id?
      errors.add(:facebook_access_token, "does not match facebook id")
    end
  end

  def facebook_access_token_matches_facebook_id?(access_token = self.facebook_access_token)
    url = "https://graph.facebook.com/me?fields=id&access_token=#{ access_token }"
    response = JSON.parse(HTTParty.get(url))

    response["id"] == self.facebook_id
  end
end
