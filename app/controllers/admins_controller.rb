class AdminsController < ApplicationController

  def index
    @admins = Admin.search(params[:search_query]).order('created_at DESC').paginate(:per_page => 20, :page => params[:page])

  end


  def new
    @admin = Admin.new
  end

  def show
  begin
    @admins = Admin.find(params[:id])
    @adminpost = @admins.posts.order('created_at DESC')


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

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
     if @admin.update_attributes(params[:admin])
       flash[:success] = "Your details have been updated"
       redirect_to :back
     end
  end
end
