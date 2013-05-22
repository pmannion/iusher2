class Contact < ActiveRecord::Base
  attr_accessible :body, :category, :email, :name
end
