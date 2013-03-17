class Complaint < ActiveRecord::Base
  attr_accessible :branch, :comment, :latitude, :longitude, :screen, :seat



  belongs_to :user

  def user_longitude
    longitude
  end

  def user_latitude
    latitude
  end

  def branch_longitude
    -6.315654299999999
  end

  def branch_latitude
    53.2983071
  end

  def long_acceptable_dif
    longitude
  end

  def minus_acceptable_dif
    -0.300001
  end


  def trust_level
    if user_longitude == branch_longitude && user_latitude == branch_latitude
     "high"
    else
      "low"
    end
  end

end


