class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :profile_name, :trust_level, :user_type
  has_many :posts
  has_many :complaints
  has_many :user_friendships
  has_many :friends, through: :user_friendships
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 40}
  validates :profile_name, presence: true, uniqueness: true, length: {maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with:VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}


  def full_name
    first_name + " " + last_name
  end



  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end





end
