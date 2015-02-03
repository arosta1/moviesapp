class SessionsController < ApplicationController
  before_filter :signed_in?
  def new
  end

  def create
    user = User.find_by_name(params[:name])
	if user && user.authenticate(params[:password])
	      session[:user_id]=user.id #stores the id in the session
          redirect_to session[:return_to] || root_path        #displays the user/show view
    else
	      flash.now[:error] = "Invalid name/password combination"
	      render 'new' #shows the signin page again
	end
  end
  
  def destroy
         if signed_in?
		           session[:user_id] = nil
		 else
                   flash[:notice] = "You Need To Sign In First"
         end  
         redirect_to signin_path		 
  end
end
