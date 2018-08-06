class SessionsController < ApplicationController

	def new
		@users = User.all
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			redirect_to signin_path
			flash[:error] = "Invalid Login Combo"
		end
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end
	


end