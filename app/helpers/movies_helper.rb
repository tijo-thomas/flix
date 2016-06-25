module MoviesHelper

	# custom helper method that calls the flop? method from the Movie class
	def format_total_gross(movie)
		if movie.flop?
			content_tag(:strong, "Flop!")
		else
			number_to_currency(movie.total_gross)
		end
	end

end