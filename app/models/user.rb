class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :profile_name, :trust_level, :user_type, :pic

#--------- relationships  ----------#
  belongs_to :admins
  has_many :posts
  has_many :complaints
  has_many :comments
  has_attached_file :pic,:default_url => 'defaultpic.PNG'
  has_many :user_friendships
  has_many :friends, through: :user_friendships,
           conditions: { user_friendships: { state: 'accepted' } }

  has_many :pending_user_friendships, class_name: 'UserFriendship',
           foreign_key: :user_id,
           conditions: { state: 'pending' }
  has_many :pending_friends, through: :pending_user_friendships, source: :friend
  has_reputation :votes, source: {reputation: :votes, of: :posts}, aggregated_by: :sum
  has_secure_password

  #------- callbacks ----------#
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  #-------- validations --------#
  validates :first_name, presence: true, length: {maximum: 30}, :on => :create
  validates :last_name, presence: true, length: {maximum: 40}, :on => :create
  validates :profile_name, presence: true, uniqueness: true, length: {maximum: 25}, :on => :create
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with:VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}, :on => :create
  validates :password, presence: true, length: {minimum: 6}, :on => :create


  def full_name
    first_name + " " + last_name
  end


  def self.search(search_query)
    if search_query
      where (['first_name LIKE ? OR last_name LIKE ? OR profile_name LIKE ?', "%#{search_query}%",
                                 "%#{search_query}%", "%#{search_query}%"])

    else
      scoped
    end
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
