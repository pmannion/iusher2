class Admin < ActiveRecord::Base
  attr_accessible :company, :branch, :email, :latitude, :longitude, :password
  #callbacks
  before_save { |admin| admin.email = email.downcase }
  before_save :create_remember_token


  has_secure_password
  has_many :posts
  has_many :complaints


  validates :branch, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :password, presence: true, length: {minimum: 8}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with:VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}

  private

  #adds a remember(session) token to self(admin), is added before the admin saves to the database - see callback
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end


end
