class ReviewsController < ApplicationController

	def index
		@movie = Movie.find(params[:movie_id])
		@reviews = @movie.reviews
	end

	def new
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.new
	end

	def create
		@movie = Movie.find(params[:movie_id])
		@review = @movie.reviews.new(review_params)
		if @review.save
			redirect_to movie_reviews_path(@movie), notice: "Thanks for your review!"
		else
			render :new
		end
	end

	private

	# Returns a new hash that includes only the permitted attributes. The .require method will raise an exception if the given key ':review' in this case isn't found in the params object.
	def review_params
		params.require(:review).permit(:name, :comment, :stars)
	end


end