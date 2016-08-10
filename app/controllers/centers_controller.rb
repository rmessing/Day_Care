class CentersController < ApplicationController

  def rpt_attend
    @children = Child.order("lname")
  end

   def rpt_meal
    @children = Child.order("lname")
  end

  def index
   
  end

  def show
    @center = Center.find(params[:id])
     if @center != current_center
      flash[:alert] = "You do not have access to this page."
      redirect_to root_path
    end
  end

  def new
    @center = Center.new
    @group = Group.find(params[:id])
  end

  def create
    if @center.save
      session[:center_id] = @center.id
      flash[:notice] = "Center #{@center.name} is a new location!"
      redirect_to centers_path
    else
      flash[:alert] = "There was a problem creating a new center. Please try again."
      render :new
    end
  end

  def Edit
    @center = Center.find(params[:id])
  end

  def update
    @center = Center.find(params[:id])
    @center.update(center_params)
    flash[:notice] = "Center #{@center.name} has been updated."
    redirect_to center_path
  end

  def destroy
    if Center.find(params[:id]).destroy
      flash[:notice] = "The center has been deleted."
    else
      flash[:alert] = "Center #{@center.name} did not delete."
    end
    redirect_to (:back)
  end

  private
  def center_params
    params.require(:center).permit(:name, :email, :password, :breakfast, :am_snack, :lunch, :pm_snack, :supper, :late_snack)
  end

end
