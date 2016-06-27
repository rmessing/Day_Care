class HandoffsController < ApplicationController
  def index
    @centers = Center.all
    @meals = Meal.all
    @groups = Group.all
    @teachers = Teacher.all
    @handoffs = Handoff.all
    @children = Child.all
  end

  def show
  end

  def new
  end

  def create
     @handoff = Handoff.new(handoff_params)
     if @handoff.save
      flash[:notice] = "The handoff was recorded!"
      redirect_to (:back)
     else
      flash[:notice] = "The handoff was NOT recorded - Try Again."
      redirect_to (:back)
     end
  end

  def edit
  end

  def update
  end

  def destroy
    Handoff.find(params[:id]).destroy
    redirect_to (:back)
  end

  private 

  def handoff_params
    params.require(:handoff).permit(:attend, :child_id) 
  end
end
