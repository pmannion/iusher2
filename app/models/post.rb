class Post < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  belongs_to :admin

  has_reputation :votes, source: :user, aggregated_by: :sum
  has_many :comments

  validates :content, presence: true, length: {maximum:300}
end
