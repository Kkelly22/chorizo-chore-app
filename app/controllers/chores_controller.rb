class ChoresController < ApplicationController
	layout "users"

	def index
		@chores = []
		current_user.households.each do |household|
			household.chores.each do |chore|
				@chores << chore
			end
		end
    #  	@chores = Chore.all
	end

	def new
		@chore = Chore.new
	end 

	def create
		@chore = Chore.create(chore_params)
		if @chore.household == nil
			redirect_to new_chore_path
			flash[:error] = "Please Create Household First"
		elsif @chore
			redirect_to chore_path(@chore)
		else
			redirect_to new_chore_path
		end
	end

	def show
		@chore = Chore.find_by(id: params[:id])
	end

	def edit
		@chore = Chore.find_by(id: params[:id])
	end

	def update
		@chore = Chore.find_by(id: params[:id])
		@chore.update(chore_params)
		if @chore.household == nil
			redirect_to new_chore_path
			flash[:error] = "Please Create Household First"
		elsif @chore
			redirect_to chore_path(@chore)
		else
			redirect_to edit_chore_path
		end
	end

	def destroy
		@chore = Chore.find_by(id: params[:id])
		@chore.destroy
		redirect_to chores_path
	end

	private

	def chore_params
		params.require(:chore).permit(:description, :point_value, :household_name)
	end

end
