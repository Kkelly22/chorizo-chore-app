class ChoresController < ApplicationController
	layout "users"

	def index
		@chores = Chore.all
	end

	def new
		@chore = Chore.new
	end

	def create
		@chore = Chore.create(chore_params)
		if @chore
			redirect_to chore_path(@chore)
		else
			render :new
		end
	end

	def show
		@chore = Chore.find_by(id: params[:id])
	end

	def edit
		@chore = Chore.find_by(id: params[:id])
	end

	def update
		@chore = Chore.update(chore_params)
		if @chore
			redirect_to chore_path(@chore)
		else
			render :edit
		end
	end

	def destroy
		@chore = Chore.find_by(id: params[:id])
		@chore.destroy
		redirect_to chores_path
	end

	private

	def chore_params
		params.require(:chore).permit(:description, :due_date, :point_value, :household_name, :user_name)
	end

end
