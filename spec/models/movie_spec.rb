require 'rails_helper'

describe "A movie" do
	it "is a flop if the total gross is less than $50M" do
		movie = Movie.new(total_gross: 40000000.00) # We don't need to initialize the movie object with a full set of attributes so we don't call the movie_attributes method because flop? only looks at the total_gross attribute. We use .new because we don't need to create the movie in the database.

		expect(movie.flop?).to eq(true)
	end

	it "is not a flop if the total gross is $50M+" do
		movie = Movie.new(total_gross: 60000000.00)

		expect(movie.flop?).to eq(false)
	end
end