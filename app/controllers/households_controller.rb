class HouseholdsController < ApplicationController
	layout "users"

	def index
		if params[:user_id]
      		@households = User.find(params[:user_id]).households
    	else
      		@households = Household.all
    	end
	end

	def new
		@household = Household.new
	end

	def create
		@household = Household.create(household_params)
		if @household
			@household.users << current_user
			redirect_to household_path(@household)
		else
			redirect_to new_household_path
		end
	end

	def show
		@household = Household.find_by(id: params[:id])
	end

	def edit
		@household = Household.find_by(id: params[:id])
	end

	def update
		@household = Household.find_by(id: params[:id])
		@household.update(household_params)
		if @household
			redirect_to household_path(@household)
		else
			redirect_to edit_household_path
		end
	end

	def join
		@household = Household.find_by(id: params[:household_id])
		current_user.households << @household
		redirect_to household_path(@household)
	end

	def destroy
		@household = Household.find_by(id: params[:id])
		@household.destroy
		redirect_to households_path
	end

	private

	def household_params
		params.require(:household).permit(:name)
	end

end
