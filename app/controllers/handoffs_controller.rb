class HandoffsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
     @handoff = Handoff.new(handoff_params)
     puts "!!!!!!!!!!!!!!!!!!!!!!!"
     if @handoff.save
      flash[:notice] = "Your handoff has been recorded!"
      redirect_to (:back)
     else
      flash[:notice] = "Your handoff was NOT recorded - Try Again."
      redirect_to (:back)
     end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def handoff_params
    params.require(:handoff).permit(:attend, :child_id) 
  end
end
