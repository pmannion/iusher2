class ProfilesController < ApplicationController
# check if there is a user and they are signed in or render public 404
def show
  @user = User.find_by_profile_name(params[:id])
    if signed_in? && !@user.nil?

    @user = User.find_by_profile_name(params[:id])
    @post = @user.posts.page(params[:page]).order('created_at desc')
    @user_friendships = current_user.user_friendships.all
    @profile_friendships = current_user.user_friendships.order('RANDOM()').limit(12)
    @friend_list =  @user.user_friendships.order('RANDOM()').limit(12)
    @comments = Comment.all
    @admin = Admin.all
    else
      render 'public/404'
    end
  end
end





