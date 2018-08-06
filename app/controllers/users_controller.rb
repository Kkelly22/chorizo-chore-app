class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find_by(id: params[:id])
	end

	def new
		@user = User.new
		render :layout => "welcome"
	end

	def create
		@user = User.create(user_params)
		if @user && @user.valid?
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render :new, :layout => "welcome"
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :image, :roommate_rating, :points, :household_name)
	end

end
