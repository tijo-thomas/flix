class FavoritesController < ApplicationController
	before_action :require_signin
	before_action :set_movie

	def create
		@movie.favorites.create(user: current_user)
		redirect_to movie_path(@movie), notice: "Thanks for fav'ing!"
	end

	# Finds the favorite in the favorites array of the
	# current user that has the id in the URL and destroys it.
	def destroy
		favorite = current_user.favorites.find(params[:id])
		favorite.destroy

		redirect_to movie_path(@movie), notice: "Sorry you unfaved it!"
	end


	private

		def set_movie
			@movie = Movie.find_by!(slug: params[:movie_id])
		end
end