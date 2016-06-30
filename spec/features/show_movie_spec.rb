require 'rails_helper'

describe "Viewing an individual movie" do
	
	it "shows the movie's details" do
		
		movie = Movie.create(movie_attributes(total_gross: 300000000.00))

		visit movie_url(movie.id)

		expect(page).to have_text(movie.title)
		expect(page).to have_text(movie.rating)
		expect(page).to have_text("$300,000,000.00")
		expect(page).to have_text(movie.description)
		expect(page).to have_text(movie.released_on)
	end

	it "shows the total gross if the total goss exceeds $50M" do
		
	end

	it "shows 'Flop!' if the total gross is less than $50M"

end