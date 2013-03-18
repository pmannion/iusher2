class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
    @post = @user.posts.all

  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "you have successfully created your account !"
      redirect_to @user

    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if
    @user.update_attributes(params[:user])
      redirect_to @user, :notice => "Your details have been updated"

    end
  end
end
