class ChildrenController < ApplicationController
  def index
    @children = Child.order("lname")
    @parent = Parent.order("name")
    @center = current_center
  end

  def show
    @child = Child.find(params[:id])
    @parents = Parent.all
    @center = current_center
  end

  def new
      @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      flash[:notice] = "Child #{@child.fname} #{@child.mname} #{@child.lname} is registered!"
    else
    flash[:alert] = "The child is not registered. First & last names are required."
    end
    redirect_to (:back)
  end

  def edit
    @child = Child.find(params[:id])
    @center = current_center
  end

  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
      flash[:notice] = "Child #{@child.fname} #{@child.lname} has been updated."
    else
      flash[:alert] = "Child #{@child.fname} #{@child.lname} did not update. Please try again."
    end
    redirect_to children_path, method: :get
  end

  def destroy
    if Child.find(params[:id]).destroy
      flash[:notice] = "The child was deleted."
    else
      flash[:alert] = "The child was not deleted. Please try again."
    end
    redirect_to children_path, method: :get
  end

  private

   def child_params
    params.require(:child).permit(:fname, :mname, :lname, :food_subsidy, :group_id)
   end
end
