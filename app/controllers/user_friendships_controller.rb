class UserFriendshipsController < ApplicationController

  def index
    @user_friendships = current_user.user_friendships.all
  end

  def accept
    @user_friendship = current_user.user_friendships.find(params[:id])
    if @user_friendship.accept!
      flash[:success] = "#{@user_friendship.friend.first_name} is now a contact"
    else
      flash[:error] = "That contact could not be created"
    end
    redirect_to user_friendships_path
  end

  def edit
    @user_friendship = current_user.user_friendships.find(params[:id])
  end

  def new
    if params[:friend_id]
      #removed params[:profile_names] to pass in user id instead of profile_name
      @friend = User.where(params[:friend_id]).first
      raise ActiveRecord::RecordNotFound if @friend.nil?
      @user_friendship = current_user.user_friendships.new(friend: @friend)
    else
      flash[:notice] = "friend required"
    end
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found
  end

  def create
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
      @user_friendship = UserFriendship.request(current_user, @friend)
       if @user_friendship.new_record?
         flash[:error] = "there was a problem with your request"
       else
      flash[:success] = "your request has been sent"
      end
      redirect_to current_user
    else
      flash[:error] = "friend required"
      redirect_to root_path
  end
  end

  def destroy
    @user_friendship = current_user.user_friendships.find(params[:id])
    @user_friendship.destroy
    flash[:notice] = "You are no longer contacts"
    redirect_to user_friendship_path
  end
end

