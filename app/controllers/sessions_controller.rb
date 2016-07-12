class SessionsController < ApplicationController

  def new_parent
    @parent = Parent.new
  end

  def create_parent
    @parent = Parent.find_by_email(params[:session][:email])
    if @parent && @parent.authenticate(params[:session][:password])
       flash[:notice] = "Welcome #{@parent.name}!"
       session[:parent_id] = @parent.id 
	     redirect_to parent_path(current_parent)
    else
		   flash[:alert] = "Invalid email/password combination."
		   redirect_to parent_log_in_path
    end 
  end

  def destroy_parent
	  session[:parent_id] = nil
    redirect_to "/" 
  end

  def new_teacher
    @teacher = Teacher.new
  end

  def create_teacher
    @teacher = Teacher.find_by_email(params[:session][:email])
    if @teacher && @teacher.authenticate(params[:session][:password])
      flash[:notice] = "Welcome #{@teacher.name}!"
      session[:teacher_id] = @teacher.id
      redirect_to new_meal_path
    else
      flash[:alert] = "Invalid email/password combination."
      redirect_to teacher_log_in_path
    end 
  end

  def destroy_teacher
    session[:teacher_id] = nil
    # flash[:notice] = "You are logged off."
    redirect_to "/"
  end

  def new_center
    @center = Center.new
  end

  def create_center

    @center = Center.find_by_email(params[:session][:email])
    if @center && @center.authenticate(params[:session][:password])
      flash[:notice] = "Welcome #{@center.name}!"
      session[:center_id] = @center.id
      redirect_to center_path(current_center)
    else
      flash[:alert] = "Invalid email/password combination."
      redirect_to center_log_in_path
    end 
  end

  def destroy_center
    session[:center_id] = nil
    # flash[:notice] = "You are logged off."
    redirect_to "/" 
  end
end

