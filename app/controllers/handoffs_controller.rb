class HandoffsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
     @handoff = Handoff.new(handoff_params)
     if @handoff.attend == ""
       flash[:alert] = "Choose drop-off or pick-up before submit."
       elsif @handoff.save
        flash[:notice] = "The handoff was recorded!"
       else
        flash[:alert] = "The handoff was NOT recorded - Try Again."
       end
     redirect_to (:back)
  end

  def edit
  end

  def update
  end

  def destroy
    if Handoff.find(params[:id]).destroy
      flash[:notice] = "The handoff has been deleted"
    else
      flash[:alert] = "The handoff was not deleted - Try again."
    end
    redirect_to (:back)
  end

  private 

  def handoff_params
    params.require(:handoff).permit(:attend, :child_id) 
  end
end
