class SessionsController < ApplicationController

	def new
		
	end
	
	# Finds the user that matches the submitted email
	# and assigns to variable 'user'. Then verifies
	# that the submitted password is correct for that
	# user.
	# The .find_by can return nil so we have to use a
	# conditional to check whether the user was authenticated
	# or not.
	def create
		# Calls the class level 'authenticate' method in the
		# User model.
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			flash[:notice] = "Welcome back, #{user.name}!"
			redirect_to user_path(user.id)
		else
			# We use 'flash.now' because it is not coming before
			# a redirect request. Flashes by default get picked
			# up in the next request, but here we are just
			# re-rendering the form so we use 'flash.now' to
			# make the flash message available in the same request
			# instead of wainting for the next request.
			flash.now[:alert] = "Invalid email/password combination!"
			render :new
		end
	end

end