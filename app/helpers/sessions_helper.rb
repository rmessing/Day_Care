module SessionsHelper
# Logs in the parent.
	def parent_log_in(parent)
		session[:parent_id] = parent.id
	end

# Returns the currentlogged-in parent (if any).
	def current_parent
		@current_parent ||= Parent.find_by(id: session[:parent_id])
	end

# Returns true if the user is logged in, false otherwise.
	def parent_logged_in?
		!current_parent.nil?
	end
# Logs in the teacher.
	def teacher_log_in(teacher)
		session[:teacher_id] = teacher.id
	end

# Returns the current logged-in teacher (if any).
	def current_teacher
		@current_teacher ||= Teacher.find_by(id: session[:teacher_id])
	end

# Returns true if the teacher is logged in, false otherwise.
	def teacher_logged_in?
		!current_teacher.nil?
	end	

# Logs in the center.
	def center_log_in(center)
		session[:center_id] = center.id
	end

# Returns the current logged-in center (if any).
	def current_center
		@current_center ||= Center.find_by(id: session[:center_id])
	end

# Returns true if the center is logged in, false otherwise.
	def center_logged_in?
		!current_center.nil?
	end
end
