require 'rails_helper'

describe "Viewing the list of movies" do #this is an example group that groups a set of related code examples.
	it "shows the movies" do
		visit movies_url

		expect(page).to have_text("3 Movies")
		expect(page).to have_text("Movies 1")
		expect(page).to have_text("Movies 2")
		expect(page).to have_text("Movies 3")
	end
	
end