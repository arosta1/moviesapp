class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include ApplicationHelper
  
  def authorise
    unless signed_in? 
	    store_location
		redirect_to signin_path, :notice =>"Please sign in to access this page."
	end
  end
  
  def authoriseAdmin
    unless signed_in? && @current_user.admin? #application helper
	store_location
	redirect_to signin_path, :notice => "You do not have sufficient privileges to perform this action"
	end
  end
  
  private
  def store_location
    session[:return_to] = request.fullpath
  end  	
end
