class TeachersController < ApplicationController
  def index
  end

  def show
    @group = Group.find(params[:id])
    @meal = Meal.new
    @teacher = Teacher.find(params[:id])
    if @teacher != current_teacher
      flash[:notice] = "You do not have access to that page"
      redirect_to root_path
    end

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
