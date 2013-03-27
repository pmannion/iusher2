class Complaint < ActiveRecord::Base
  attr_accessible :branch, :comment, :latitude, :longitude, :screen, :seat
  validates :branch, presence: true
  validates :screen, presence: true
  validates :seat, presence: true



  belongs_to :user

  def user_longitude
    longitude
  end

  def user_latitude
    latitude
  end

  #createing a admin_user model with branch name, address, longitude and latitude  may change this !
  def branch_longitude
    -6.315654299999999
  end

  def branch_latitude
    53.2983071
  end

  #No margin for error in co-ordinates, need to allow a minor difference e.g.(0.20)
  def trust_level
    if branch_latitude == user_latitude && user_longitude == branch_longitude
      'High'
    else
      'Low'
    end
  end
end








