class TeachersController < ApplicationController
  def index
    @teacher = Teacher.all
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
    @teacher = Teacher.new
    @group = Group.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      # session[:teacher_id] = @teacher.teacher_id
      flash[:notice] = "New Teacher is created!"
    else
      flash[:notice] = "New Teacher was not created; try again."
    end
    redirect_to (:back)
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update(teacher_params)
    flash[:notice] = "Teacher has been updated."
    redirect_to teacher_path
  end

  def destroy
    Teacher.find(params[:id]).destroy
    reidrect_to (:back)
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :center_id, :password)
  end
end
