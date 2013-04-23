class ProfilesController < ApplicationController
  def show

    @user = User.find_by_profile_name(params[:id])

    if @user
      @post = @user.posts.order(:created_at).page(params[:page])
      @user_friendships = current_user.user_friendships.all
      render action: :show
    else
      render file: 'public/404', status: 404, formats: [:html]
    end
  end
end

