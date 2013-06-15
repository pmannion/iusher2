class QuestionsController < ApplicationController

  def index
    @question = Question.paginate(page: params[:page], per_page:12, order: 'created_at DESC')
  end

  def new
  @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params[:question])
    respond_to do |format|
      if @question.save
        format.html { redirect_to root_path, notice: 'Thank you for your inquiry'}
        format.json { render json: @question, status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render json: @question.errors, status: :unprocessable_entity  }
      end
    end
  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = 'message deleted'
    redirect_to questions_path
  end
end
