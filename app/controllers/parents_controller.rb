class ParentsController < ApplicationController
  def index
  	@parents = Parent.all
  end

  def show
  	@handoff = Handoff.new
    @parent = Parent.find(params[:id])
    if @parent != current_parent
    	flash[:notice] = "You do not have access to that page"
    	redirect_to root_path
    end
  end

  def new
  	@parent = Parent.new
  end

  def create
     @parent = Parent.new(parent_params)
  	if @parent.save
  	  session[:parent_id] = @parent.id
  	  flash[:notice] = "Welcome!"
	  else
	  flash[:alert] = "There was a problem creating a new parent. Please try again."
	  end
    redirect_to (:back)
  end

  def edit
  	@parent = Parent.find(params[:id])
  end

  def update
  	@parent = Parent.find(params[:id])
  	@parent.update(parent_params)
  	flash[:notice] = "Parent has been updated"
  	redirect_to parents_path
  end

  def destroy
  	Parent.find(params[:id]).destroy
  	redirect_to (:back)
  end

  private
  def parent_params
  	params.require(:parent).permit(:name, :email, :password)
  end

end
