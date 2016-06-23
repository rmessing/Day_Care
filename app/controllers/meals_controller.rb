class MealsController < ApplicationController
  def index
  end

  def show
  end

  def new
    # @group = Group.find(params[:id])
    @meal = Meal.new
  end

  def create
    # binding.pry
    @meal = Meal.new(meal_params)
      if @meal.save
        redirect_to group_meals_path(Child.find(params[:meal][:child_id]).group)
      else
        flash[:alert] = "There was a problem recording the meals. Please try again."
        redirect_to (:back)
    end
  end

  def edit
   
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
    # flash[:notice] = "Meals have been updated."
    redirect_to (:back)
  end

  def destroy
    Meal.find(params[:id]).destroy
    redirect_to (:back)
  end

  private

  def meal_params
    params.require(:meal).permit(:child_id, :signature, :meal_type, :teacher_id, :meal_date, :breakfast, :am_snack, :lunch, :pm_snack, :supper, :late_snack)
  end
end
