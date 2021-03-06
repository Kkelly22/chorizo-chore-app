class SessionsController < ApplicationController

	def new
		@users = User.all
		@user = User.new
		render :layout => "welcome"
	end

	def create
		if auth_hash = request.env['omniauth.auth']
			@user = User.find_or_create_by_omniauth(auth_hash)
			session[:user_id] = @user.id
			redirect_to user_path(@user)
   		else
			@user = User.find_by(email: params[:email])
			if @user && @user.authenticate(params[:password])
				session[:user_id] = @user.id
				redirect_to user_path(@user)
			else
				redirect_to signin_path, :layout => "welcome"
				flash[:error] = "Invalid Login Combo"
			end
		end
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end


end