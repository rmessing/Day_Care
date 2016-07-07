class ParentsController < ApplicationController
  def index
  	@parents = Parent.all
  end

  def show
  	@handoff = Handoff.new
    @parent = Parent.find(params[:id])
    if @parent != current_parent
    	flash[:alert] = "You do not have access to this page"
    	redirect_to root_path
    end
  end

  def new
  	@parent = Parent.new
  end

  def create
     @parent = Parent.new(parent_params)
  	if @parent.save
  	  flash[:alert] = "Parent #{@parent.name} is registered!"
	  else
	    flash[:alert] = "New parent was not registered. Please try again."
	  end
    redirect_to (:back)
  end

  def edit
  	@parent = Parent.find(params[:id])
  end

  def update
  	@parent = Parent.find(params[:id])
  	if @parent.update(parent_params)
  	  flash[:alert] = "Parent #{@parent.name} has been updated"
    else
      flash[:alert] = "Parent #{@parent.name} did not update. Please try again."
    end
  	redirect_to parents_path, method: :get
  end

  def destroy
  	if Parent.find(params[:id]).destroy
      flash[:alert] = "Parent #{@parent.name} was deleted"
    else
      flash[:alert] = "The parent did not delete. Please try again."
    end
  	redirect_to parents_path, method: :get
  end

  private
  def parent_params
  	params.require(:parent).permit(:name, :email, :password)
  end

end
