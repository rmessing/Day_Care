class GroupsController < ApplicationController
  def index
    @groups = Group.order("name")
    @center = current_center
  end

# detecting no group select error before system abbend.
  def view
    if params[:group][:id] == ""
      flash[:alert] = "First select your class."
      redirect_to (:back)
    else  
      redirect_to group_path(params[:group][:id])
    end
  end

  def show
    @teacher = current_teacher
  # accounting for nested or unnested params
    if params[:group] && params[:group][:id]
      @group = Group.find(params[:group][:id])
    else 
      @group = Group.find(params[:id])
    end
  #
    if params[:date]
      @date = DateTime.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    else
      @date = DateTime.now.to_date
    end
  end

  def new
    @group = Group.new
    @teachers = Teacher.all
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "Class #{@group.name} is registered!"
      redirect_to (:back)
    else
      flash[:alert] = "There was a problem registering a new class. Please try again."
      redirect_to (:back)
    end
  end

  def edit
    @group = Group.find(params[:id])
    @teachers = Teacher.all
    @center = current_center
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "Class #{@group.name} was updated."
      redirect_to groups_path, method: :get
    else
      flash[:alert] = "Class update failed. Please try again."
      redirect_to (:back)
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      flash[:notice] = "The class was deleted."
      redirect_to groups_path, method: :get
    else
      flash[:alert] = "The class did not delete. Please try again."
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :teacher_id)
  end
end
