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

  ##
  # Instance Methods
  #
  def authenticate(access_token)
    return false if access_token.blank?

    response = fetch_facebook_data(access_token)
    if response['id'] == self.facebook_id
      self.facebook_access_token = access_token
      self.first_name = response['first_name']
      self.last_name = response['last_name']
      self.save
    else
      false
    end
  end

  def fetch_facebook_data(access_token = self.facebook_access_token)
    url = "https://graph.facebook.com/me?fields=id,first_name,last_name&access_token=#{ access_token }"
    JSON.parse(HTTParty.get(url))
  end

  def unread_messages
    Message.unread_messages_by_user(self)
  end
end
