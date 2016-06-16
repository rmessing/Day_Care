class SessionsController < ApplicationController

  def new_parent
    # puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    # puts session[:parent_id]
    @parent = Parent.new
  end

  def create_parent

    @parent = Parent.find_by_email(params[:session][:email])

    if @parent && @parent.authenticate(params[:session][:password])


	    flash[:notice] = "You are logged in."

	    
	    session[:parent_id] = @parent.id

	    redirect_to parent_path(current_parent)
    else

		  flash[:alert] = "Invalid email/password combination."
		  redirect_to parent_log_in_path
    end 
  end

  def destroy_parent

	  session[:parent_id] = nil

	  flash[:notice] = "You've been logged out successfully."

	  redirect_to "/" 

  end

  def new_teacher
    # puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    # puts session[:teacher_id]
    @teacher = Teacher.new
  end

  def create_teacher

    @teacher = Teacher.find_by_email(params[:session][:email])

    if @teacher && @teacher.authenticate(params[:session][:password])


      flash[:notice] = "You've been logged in."

      
      session[:teacher_id] = @teacher.id

      redirect_to teacher_path(current_teacher)
    else

      flash[:alert] = "Invalid email/password combination."
      redirect_to teacher_log_in_path
    end 
  end

  def destroy_teacher

    session[:teacher_id] = nil

    flash[:notice] = "You've been logged out successfully."

    redirect_to "/" 

  end

  def new_center
    # puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    # puts session[:center_id]
    @center = Center.new
  end

  def create_center

    @center = Center.find_by_email(params[:session][:email])

    if @center && @center.authenticate(params[:session][:password])


      flash[:notice] = "You've been logged in."

      
      session[:center_id] = @center.id

      redirect_to center_path(current_center)
    else

      flash[:alert] = "Invalid email/password combination."
      redirect_to center_log_in_path
    end 
  end

  def destroy_center

    session[:center_id] = nil

    flash[:notice] = "You've been logged out successfully."

    redirect_to "/" 

  end
end

