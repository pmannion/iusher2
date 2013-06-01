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
    if @question.save
      flash[:success] = 'Thank you for your inquiry'
      redirect_to root_path
    end

  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = 'message deleted'
    redirect_to questions_path
  end
end
