class MealsController < ApplicationController
  def index
  end

  def show
  end

  def new
      @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
      if @meal.save
        # redirect_to group_meals_path(Child.find(params[:meal][:child_id]).group)
        flash[:alert] = "Meals were saved."
        redirect_to (:back)
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
    flash[:notice] = "Meals were updated."
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
