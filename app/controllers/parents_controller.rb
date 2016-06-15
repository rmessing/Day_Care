class ParentsController < ApplicationController

  def show
  	@handoff = Handoff.new
    @parent = Parent.find(params[:id])
    if @parent != current_parent
    	flash[:notice] = "You do not have access to that page"
    	redirect_to root_path
    end
  end

end
