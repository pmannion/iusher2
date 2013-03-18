class UserFriendshipsController < ApplicationController

  def new
    if params[:friend_id]
      @friend = User.where(profile_name: params[:friend_id]).first
      @user_friendship = current_user.user_friendships.new(friend: @friend)
    else
      flash[:error] = "You must add as a friend"
    end
  rescue ActiveRecord::RecordNotFound
    render file 'public/404', status: :not_found
  end

  def create
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
      @user_friendship = current_user.user_friendships.new(friend: @friend)
      @user_friendship.save
      flash[:success] = "you are now connected"
      redirect_to current_user
    else
      flash[:error] = "friend required"
      redirect_to root_path
  end
 end
end
