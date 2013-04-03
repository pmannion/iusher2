module SessionsHelper
  # session for users-----------------------
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||=User.find_by_remember_token(cookies[:remember_token])
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  # user session ends ----------------------------

  #session for admins-----------------------------

  def sign_admin(admin)
    cookies.permanent[:remember_token] = admin.remember_token
    self.current_admin = admin
  end

  def current_admin=(admin)
    @current_admin = admin
  end

  #set a cookie if the admin is found(by remember token), setting the cookie works only the first time Admin is found.
  def current_admin
    @current_admin ||= Admin.find_by_remember_token(cookies[:remember_token])
  end

  def admin_signed_in?
    !current_admin.nil?
  end

  def admin_out
    self.current_admin = nil
    cookies.delete(:remember_token)
  end
end
