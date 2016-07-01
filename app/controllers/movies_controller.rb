class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def show
		@movie = Movie.find(params[:id])
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross) # Returns a new hash that includes only the permitted attributes. The .require method will raise an exception if the given key ':movie' in this case isn't found in the params object.
		@movie.update(movie_params)
		redirect_to movie_path(@movie.id) # This redirects to the show action using a named route.
	end

end