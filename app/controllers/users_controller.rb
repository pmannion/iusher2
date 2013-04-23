class UsersController < ApplicationController

  def index

    @user = User.all#paginate(per_page: 7,
                    #  :page => params[:page],
                    #:order => 'created_at DESC').search(params[:search_query])
    @user_friendships = current_user.user_friendships.all

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
    @user = User.find_by_profile_name(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if
    @user.update_attributes(params[:user])
      redirect_to @user.profile_name, :notice => 'Your details have been updated'
    end
  end
end



