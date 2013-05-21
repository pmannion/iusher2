module ApplicationHelper
  def pic_for(admin,image_options={}, html_options={})
    link_to(image_tag(admin.pic.url,image_options),@current_admin ,html_options)
  end


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
