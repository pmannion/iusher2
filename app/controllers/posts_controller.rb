class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json

  respond_to :html, :json
  def index
    @post = Post.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    begin
    @post = Post.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid action #{params[:id]}"
      flash[:notice] = "Invalid Action"
      redirect_to profile_path(current_user.profile_name)
    else
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(params[:post])
    respond_to do |format|
  if @post.save
    format.html do
    flash[:success] = 'your post has been created'
    redirect_to profile_path(@current_user.profile_name)
    end
    format.json { render json: @post.to_json}
  else
    format.html do
      render @user
      flash[:error] = 'there was a problem'
    end
    format.json { render json: @post.to_json}
    end
  end
end

  # PUT /posts/1
  # PUT /posts/1.json


  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to profile_path(current_user.profile_name), notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to profile_path(current_user.profile_name) }
      format.json { head :no_content }
    end
  end
end
