class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def show
    @admins = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      redirect_to root_path
      flash[:success] = 'Welcome to i Usher'
    else
      render 'new'
      flash[:error] = 'there was a problem'
    end
  end
end
