require 'rails_helper'

describe "Viewing a user's profile page" do

  it "shows the user's details" do
    user = User.create!(user_attributes)

    sign_in(user) # Signs in the user using the previously made sign_in method.

    visit user_url(user)

    expect(page).to have_text(user.name)
    expect(page).to have_text(user.email)
  end

  it "shows the user's favorites in the sidebar" do
  	user = User.create!(user_attributes)
  	movie = Movie.create!(movie_attributes)
  	user.favorite_movies << movie

  	sign_in(user)

  	visit user_url(user)

  	within("aside#sidebar") do
  		expect(page).to have_text(movie.title)
  	end
  end

end