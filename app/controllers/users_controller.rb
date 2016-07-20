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
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
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
		@user = User.find(params[:id])
		@user.destroy
		session[:user_id] = nil # Signs out user after destroying it.
		redirect_to root_url, alert: "Account successfully deleted!"
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
	end
end