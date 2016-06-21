class GroupsController < ApplicationController
  def index
  end

  def view
    if params[:group][:id] == ""
      flash[:notice] = "First select your class."
      redirect_to (:back)
    else  
      redirect_to group_meals_path(params[:group][:id])
    end
  end

  def show
    @group = Group.find(params[:id])
    # binding.pry
    if params[:date]
      @date = DateTime.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i)
    else
      @date = DateTime.new
    end
  end

  def new
    @group = Group.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
