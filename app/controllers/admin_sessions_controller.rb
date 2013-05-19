class AdminSessionsController < ApplicationController

  def new

  end

  def create
    #find admin by email using the session hash, downcase because a callback was used in the admin model
   admin = Admin.find_by_email(params[:admin_session][:email].downcase)
   #boolean check that the email found and the password from the database match, .authenticate comes from has_secure password
    if admin && admin.authenticate(params[:admin_session][:password])
      sign_admin admin
      redirect_to @current_admin
    else
      flash.now[:error] = 'email/password combination error'
     render 'new'
    end
  end

  def destroy
    sign_out
    flash[:success] = 'You have signed out'
    redirect_to root_path
  end
end
