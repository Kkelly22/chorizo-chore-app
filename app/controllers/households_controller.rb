class HouseholdsController < ApplicationController
	layout "users"

	def index
		@households = Household.all
	end

	def new
		@household = Household.new
	end

	def create
		@household = Household.create(household_params)
		if @household
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
		@household = Household.update(household_params)
		if @household
			redirect_to household_path(@household)
		else
			redirect_to edit_household_path
		end
	end

	def destroy
		@household = Household.find_by(id: params[:id])
		@household.destroy
		redirect_to households_path
	end

	private

	def household_params
		params.require(:household).permit(:name, :user_name)
	end

end
