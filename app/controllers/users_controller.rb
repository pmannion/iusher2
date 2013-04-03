class UsersController < ApplicationController

  def index
    @user = User.paginate(:page => params[:page], :per_page => 5)
    @user_friendships = current_user.user_friendships.all

  end

  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
    @post = @user.posts.all
    #@user_friendships = UserFriendship.find_all_by_state("accepted")
    @user_friendships = current_user.user_friendships.all
  end

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if
    @user.update_attributes(params[:user])
      redirect_to @user, :notice => "Your details have been updated"
    end
  end
end



