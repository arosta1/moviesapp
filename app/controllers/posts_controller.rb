class PostsController < ApplicationController

    before_filter :authorise

    def create
	    @movie = Movie.find params[:movie_id]
		@post = @movie.posts.create params[:post]
		@post.user_id = @current_user.id #sets the user_id fk
		@post.save   #saves the @post
		             #object to the posts table 
		  respond_to do |format|
		          format.html{ redirect_to @movie }
		  end
	end
end
