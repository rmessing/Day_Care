class FamiliesController < ApplicationController

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      flash[:notice] = "Parent and child are now connected!"
      redirect_to families_path
    else
      flash[:alert] = "The parent-child connection failed. Please try again."
      redirect_to (:back)
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @children = Child.order("lname")
  end

  def show
  end

  private

  def family_params
    params.require(:family).permit(:child_id, :parent_id)
  end
end
