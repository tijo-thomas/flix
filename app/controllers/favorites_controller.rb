class FavoritesController < ApplicationController
	before_action :require_signin

	def create
		@movie = Movie.find(params[:movie_id])
		@movie.favorites.create(user: current_user)
		redirect_to movie_path(@movie.id), notice: "Thanks for fav'ing!"
	end
end
