class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  add_flash_types(:danger) # This is how to register custom flash types while redirecting.


  private

  # Unless a user is signed in, we redirect to the new_session_url, including and alert message.
  # Set as private so it's not exposed to users as a
  # web accessible action.
  def require_signin
  	unless current_user
      # Stores the URL of the requested page in the session
      # before redirecting to the sign-in form.
      session[:intended_url] = request.url 
  		redirect_to new_session_url, alert: "Please sign in first!"
  	end
  end

  # The find method will raise an exception if passed value
  # of nil. So we check that the session actually has a
  # user id before calling find. This is in the
  # application_helper.rb because it should be able to be
  # called throughout the application.
  # Uses the ||= operator for memoization. This optimizes
  # the current_user method by storing the result of calling
  # User.find in an instance variable and only running the
  # query again if that instance variable doesn't already
  # have a value.
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?
end
