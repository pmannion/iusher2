class UsersController < ApplicationController

  def index
    if current_user
     @user = User.search(params[:search_query]).order('created_at DESC').paginate(:per_page => 20, :page => params[:page])
     @user_friendships = current_user.user_friendships.all
    else
      flash[:notice] = 'You must be logged in'
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  #removed and placed into a profiles controller
  #def show
  #  @user = User.find(params[:id])
  #  @post = @user.posts.all
  #  #@user_friendships = UserFriendship.find_all_by_state("accepted")
  #  @user_friendships = current_user.user_friendships.all
  #end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'you have successfully created your account, please login in !'
      redirect_to root_path
     else
      render 'new'
    end
  end

  def edit
    if current_user
      @user = User.find_by_profile_name(params[:id])
    else
      flash[:notice] = 'invalid action'
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if
    @user.update_attributes(params[:user])
      flash[:success] = "You have updated your details"
      redirect_to profile_path(current_user.profile_name)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end



