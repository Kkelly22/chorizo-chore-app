class WelcomeController < ApplicationController

	def home
		if logged_in?
			render :home, :layout => "users"
		else
			render :home
		end
	end
	
end