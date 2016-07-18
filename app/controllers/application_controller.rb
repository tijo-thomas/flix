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
  		redirect_to new_session_url, alert: "Please sign in first!"
  	end
  end
end
