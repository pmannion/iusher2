class Post < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  belongs_to :admin

  validates :content, presence: true, length: {maximum:300}
end
