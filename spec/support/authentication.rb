# This method walks through the sign in process as a test.
def sign_in
	visit new_session_url
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_button "Sign In"
end