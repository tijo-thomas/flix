class UsersController < ApplicationController
	before_action :require_signin, except: [:new, :create]
	before_action :require_correct_user, only: [:edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: "Account successfully updated!"
		else
			render :edit
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		session[:user_id] = @user.id # Auto signs in user after creating the account.
		if @user.save
			redirect_to user_path(@user.id), notice: "Thanks for signing up!"
		else
			render :new
		end
	end

	def destroy
		@user.destroy
		session[:user_id] = nil # Signs out user after destroying it.
		redirect_to root_url, alert: "Account successfully deleted!"
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
	end

	# Finds the user being accessed and compares it to the
	# currently signed in user. If they are not the same,
	# the sign in is user is denied access by redirecting
	# to the application home page.
	def require_correct_user
		@user = User.find(params[:id])
		redirect_to root_url unless current_user?(@user)
	end
end