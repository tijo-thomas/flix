require 'rails_helper'

describe "Signing out" do

  it "removes the user id from the session" do
    user = User.create!(user_attributes)

    # Calls the sign_in method that defines the sign in
    # steps. the method is in the authentication.rb file.
    sign_in(user)

    click_link 'Sign Out'

    expect(page).to have_text("signed out")
    expect(page).not_to have_link('Sign Out')
    expect(page).to have_link('Sign In')
  end

end