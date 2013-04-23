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

#--------gem activerecord_reputation_system installed tutorial rails casts 406-----------#
  def vote
    value = params[:type] == "up" ? 1 : -1
    @admins = Admin.find(params[:id])
    @admins.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back
    flash[:success] = "Thanks for voting"
  end
end
