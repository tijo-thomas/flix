module MoviesHelper

	# custom helper method that calls the flop? method from the Movie class
	def format_total_gross(movie)
		if movie.flop?
			content_tag(:strong, "Flop!")
		else
			number_to_currency(movie.total_gross)
		end
	end

	# Custom view helper method that displays a placeholder image if the movie object doesn't have an image in the database.
	def image_for(movie)
		if movie.image_file_name.blank?
			image_tag("placeholder.png")
		else
			image_tag(movie.image_file_name)
		end
	end

	def format_average_stars(movie)
		if movie.average_stars.nil?
			content_tag(:strong, "No Reviews")
		else
			pluralize(number_with_precision(movie.average_stars, precision: 1), "star")
		end
	end

end