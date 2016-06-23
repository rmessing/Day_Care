class ChildrenController < ApplicationController
  def index
    @children = Child.all
  end

  def show
  end

  def new
    @child = Child.new
  end

  def create
     @child = Child.new(child_params)
    if @child.save
      flash[:notice] = "Welcome!"
    else
    flash[:alert] = "There was a problem creating a new parent. Please try again."
    end
    redirect_to (:back)
  end

  def edit
  end

  def update
  end

  def destroy
    Child.find(params[:id]).destroy
    redirect_to (:back)
  end

  private

   def child_params
    params.require(:child).permit(:fname, :mname, :lname, :food_subsidy, :group_id)
   end
end
