class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  # protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_parent

  def current_parent
		@current_parent ||= Parent.find_by(id: session[:parent_id])
	end
end
