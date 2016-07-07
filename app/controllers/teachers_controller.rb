class TeachersController < ApplicationController
  def index
    @teachers = Teacher.order("name")
    @center = current_center
  end

  def show
    @group = Group.find(params[:id])
    @meal = Meal.new
    @teacher = Teacher.find(params[:id])
    if @teacher != current_teacher
      flash[:alert] = "You do not have access to this page"
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
       flash[:alert] = "Teacher #{@teacher.name} is registered!"
    else
       flash[:alert] = "A new Teacher was not created - Try Again."
    end
    redirect_to (:back)
  end

  def edit
    @teacher = Teacher.find(params[:id])
    @center = current_center
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      flash[:alert] = "Teacher #{@teacher.name} was updated."
      redirect_to teachers_path, method: :get
    else
      flash[:alert] = "Teacher update failed - Try Again."
      redirect_to (:back)
    end
  end

  def destroy
    if Teacher.find(params[:id]).destroy
      flash[:alert] = "The teacher was deleted."
    end
    redirect_to teachers_path, method: :get
  end

  private
  def teacher_params
    params.require(:teacher).permit(:name, :email, :center_id, :password)
  end
end
