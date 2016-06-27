class GroupsController < ApplicationController
  def index
    @groups = Group.all
    @teachers = Teacher.all 
    @center = current_center
  end

# detecting no group select error before system abbend.
  def view
    if params[:group][:id] == ""
      flash[:notice] = "First select your class."
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
      redirect_to (:back)
    else
      flash[:alert] = "There was a problem creating a new class. Please try again."
      redirect_to (:back)
    end
  end

  def edit
    @groups = Group.all
    @group = Group.find(params[:id])
    @teachers = Teacher.all
    @center = current_center
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to (:back)
  end

  def destroy
   @group = Group.find(params[:id])
   @group.destroy
   redirect_to groups_path, method: :get
  end

  private

  def group_params
    params.require(:group).permit(:name, :teacher_id)
  end
end
