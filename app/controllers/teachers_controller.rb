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
  end

  def create
    if @teacher.save
      session[:teacher_id] = @teacher.id
      flash[:notice] = "Welcome!"
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
    session[:center_id] = nil
    reidrect_to teachers_path
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :center_id, :password)
  end
end
