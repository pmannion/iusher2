class QuestionsController < ApplicationController

  def index
    @question = Question.all
    @user = User.all
  end

  def new
  @question = Question.new
  @complaint = Complaint.all
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
  end
end
