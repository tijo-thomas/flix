module ApplicationHelper

	# The find method will raise an exception if passed value
	# of nil. So we check that the session actually has a
	# user id before calling find. This is in the
	# application_helper.rb because it should be able to be
	# called throughout the application.
	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end
end