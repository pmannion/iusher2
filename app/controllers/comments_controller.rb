class CommentsController < ApplicationController

    def new
      @comment = Comment.new
      @post = Post.find(params[:post_id])
    end

    def create
      if current_user
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(params[:comment])
      if @comment.save
      flash[:success] = "Reply successful"
      redirect_to profile_path(current_user.profile_name)
      else
        flash[:error] = "The reply could not be saved"
        redirect_to profile_path(current_user.profile_name)
      end
    end
  end

    def index

      @post = Post.find(params[:post_id])
      @comments = @post.comments.all
      if @comments.empty?
        flash[:error] = "No Replies to show for this comment"
        redirect_to :back
      end
    end
  end

