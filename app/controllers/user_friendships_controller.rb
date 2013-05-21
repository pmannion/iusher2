class UserFriendshipsController < ApplicationController

  respond_to :html, :json

  def index
    if current_user
    @user_friendships = current_user.user_friendships.paginate(per_page:5,
                                                               page: params[:page],
                                                               order: 'created_at DESC')
    else

    end
  end

  def accept
    @user_friendship = current_user.user_friendships.find(params[:id])
    if @user_friendship.accept!
      flash.now[:success] = "#{@user_friendship.friend.first_name} is now a contact"
    else
      flash[:error] = 'That contact could not be created'
    end
    redirect_to user_friendships_path
  end

  def edit
    @user_friendship = current_user.user_friendships.find(params[:id])
    @friend = @user_friendship.friend
  end

  def new
    if params[:friend_id]
      #removed params[:profile_names] to pass in user id instead of profile_name
      @friend = User.where(profile_name: params[:friend_id]).first
      raise ActiveRecord::RecordNotFound if @friend.nil?
      @user_friendship = current_user.user_friendships.new(friend: @friend)
    else
      flash.now[:notice] = 'friend required'
    end
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404', status: :not_found
  end

  def create
    if params[:user_friendship] && params[:user_friendship].has_key?(:friend_id)
      @friend = User.where(profile_name: params[:user_friendship][:friend_id]).first
      @user_friendship = UserFriendship.request(current_user, @friend)
      #UserNotifier.friend_requested(@friend).deliver
      respond_to do |format|
        if @user_friendship.new_record?
        format.html do
          flash[:error] = 'there was a problem with your request'
            redirect_to profile_path
        end
          format.json { render json: @user_friendship.to_json, status: :precondition_failed}
        else
          format.html do
            flash[:success] = 'your request has been sent'
              redirect_to profile_path(@friend.profile_name)
          end
          format.json { render json: @user_friendship.to_json}
         end
        end
      else
      flash[:error] = 'friend required'
      redirect_to profile_path
    end
  end

  def destroy
    @user_friendship = current_user.user_friendships.find(params[:id])
    @user_friendship.destroy
    flash[:notice] = 'You are no longer contacts'
    redirect_to user_friendships_path
  end
end

