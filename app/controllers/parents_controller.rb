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
  	  flash[:notice] = "Parent #{@parent.name} is registered!"
	  else
	    flash[:alert] = "New parent was not registered. All fields are required."
	  end
    redirect_to (:back)
  end

  def edit
  	@parent = Parent.find(params[:id])
    @center = current_center
  end

  def update
  	@parent = Parent.find(params[:id])
  	if @parent.update(parent_params)
  	  flash[:notice] = "Parent #{@parent.name} has been updated."
    else
      flash[:alert] = "Parent #{@parent.name} did not update. Please try again."
    end
  	redirect_to children_path, method: :get
  end

  def destroy
  	if Parent.find(params[:id]).destroy
      flash[:notice] = "The parent was deleted."
    else
      flash[:alert] = "Parent did not delete. Please try again."
    end
  	redirect_to children_path, method: :get
  end

  private
  def parent_params
  	params.require(:parent).permit(:name, :email, :password)
  end

end
