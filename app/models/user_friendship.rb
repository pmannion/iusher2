class UserFriendship < ActiveRecord::Base
  #userfriendship belongs to user
  belongs_to :user
  #also belongs to friend, friend defined through class_name & foreign key
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  #fields available to access in userfriendship database
  attr_accessible :user, :friend, :user_id, :friend_id
end
