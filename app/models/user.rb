class User < ActiveRecord::Base
  has_secure_password

  ##
  # Associations
  #
  has_many :friendships, :dependent => :destroy
  has_many :friends, :through => :friendships, :conditions => { :friendships => { :accepted => true } }

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user, :conditions => { :friendships => { :accepted => true } }

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
end
