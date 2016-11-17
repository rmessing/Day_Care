class CentersController < ApplicationController

  def rpt_attend
    @children = Child.order("lname")
  end

   def rpt_meal
    @children = Child.order("lname")
  end

  def show
    @center = Center.find(params[:id])
     if @center != current_center
      flash[:alert] = "You do not have access to this page."
      redirect_to root_path
    end
  end

end
