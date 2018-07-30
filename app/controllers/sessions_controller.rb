class SessionsController < ApplicationController

	def new
		@user = User.find_by(id: params[:id])
		if @user && @user.authenticate
			session[:user_id] = @user.id
		else
			render :new
		end
	end

	def create
	end

	def destroy
	end
	


end