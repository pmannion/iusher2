class ProfilesController < ApplicationController



  def show

    @user = User.find_by_profile_name(params[:id])

    if @user
      @post = @user.posts.page(params[:page]).order('created_at desc')
      @user_friendships = current_user.user_friendships.all
      @profile_friendships = current_user.user_friendships.order('RANDOM()').limit(12)
      @friend_list =  @user.user_friendships.order('RANDOM()').limit(12)
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end


end

