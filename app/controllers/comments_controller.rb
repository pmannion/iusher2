class CommentsController < ApplicationController

    def new
      @comment = Comment.new
      @post = Post.find(params[:post_id])
    end

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(params[:comment])
      flash[:success] = "Reply successful"
      redirect_to profile_path(current_user.profile_name)
    end
  end

