class Post < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user

  validates :content, presence: true, length: {maximum:300}
end
