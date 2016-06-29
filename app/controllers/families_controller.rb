class FamiliesController < ApplicationController

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      flash[:alert] = "A new guardian was added successfully!"
      redirect_to families_path
    else
      flash[:alert] = "There was a problem creating a parent-child family dependency. Please try again."
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
    # @children = Child.all
    @children = Child.order("lname")
    @center = current_center
  end

  def show
  end

  private

  def family_params
    params.require(:family).permit(:child_id, :parent_id)
  end
end
