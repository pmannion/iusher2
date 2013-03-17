class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to @current_user
    else
      redirect_to root_path
      flash[:error] = "email/password combo incorrect"
  end
end

  def destroy
    sign_out
    redirect_to root_url
    flash[:success] = "you have successfully signed out     "
  end
end
