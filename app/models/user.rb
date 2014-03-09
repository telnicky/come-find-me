class User < ActiveRecord::Base
  has_secure_password
  before_create { generate_token(:auth_token) }

  ##
  # Associations
  #
  has_many :friendships, :dependent => :destroy
  has_many :friends, lambda { Friendship.where(:accepted => true) }, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, lambda { Friendship.where(:accepted => true) }, :through => :inverse_friendships, :source => :user

  has_many :locations, :dependent => :destroy
  has_many :location_requests, :dependent => :destroy

  ##
  # Validations
  #
  validates_uniqueness_of :email, :name
  validates_presence_of :email, :name
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  ##
  # Instance Methods
  #
  def has_friend?(user)
    friends.include?(user) || inverse_friends.include?(user)
  end

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
