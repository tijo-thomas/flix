class MoviesController < ApplicationController
	before_action :require_signin, except: [:index, :show]
	before_action :require_admin, except: [:index, :show]

	def index
		case params[:scope]
		when "hits"
			@movies = Movie.hits
		when "flops"
			@movies = Movie.flops
		else
			@movies = Movie.released
		end
	end

	def show
		@movie = Movie.find(params[:id])
		@fans = @movie.fans
		@genres = @movie.genres

		if current_user
			@current_favorite = current_user.favorites.find_by(movie_id: @movie.id)
		end
	end

	def edit
		@movie = Movie.find(params[:id])
	end

	def update
		@movie = Movie.find(params[:id])
		if @movie.update(movie_params)
			flash[:notice] = "Movie successfully updated!"
			redirect_to movie_path(@movie.id) # This redirects to the show action using a named route.
		else
			render :edit
		end
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save
			flash[:notice] = "Movie successfully created!"
			redirect_to movie_path(@movie.id)
		else
			render :new
		end
	end

	def destroy
		@movie = Movie.find(params[:id])
		if @movie.destroy
			flash[:alert] = "Movie successfully deleted!"
			redirect_to movies_path
		end
	end

	private

		# Returns ga new hash that includes only the permitted attributes. The .require method will rais an exception if the given key ':movie' in this case iisn't found in the params object.
		def movie_params
			params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross, :cast, :director, :duration, :image_file_name, genre_ids: [])
		end
end