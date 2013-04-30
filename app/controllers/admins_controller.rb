class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def show
  begin
    @admins = Admin.find(params[:id])
    @adminpost = Post.all
  rescue ActiveRecord::RecordNotFound
    logger.error "Attempt to access invalid action #{params[:id]}"
    flash[:notice] = "invalid action"
    redirect_to profile_path(current_user.profile_name)
    end
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to root_path
      flash[:success] = 'Welcome to i Usher'
    else
      render 'new'
      flash[:error] = 'there was a problem'
    end
  end

end
