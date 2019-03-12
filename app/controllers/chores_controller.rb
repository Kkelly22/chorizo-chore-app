class ChoresController < ApplicationController
	layout "users"

	def index
		@chores = current_user.all_household_chores
		respond_to do |format|
      		format.html { render :index }
      		format.json { render json: @chores }
    	end
    end

	def new
		@chore = Chore.new
	end 

	def create
		@chore = Chore.create(chore_params)
		if @chore.household == nil
			redirect_to new_chore_path
			flash[:error] = "Please Create Household First"
		elsif @chore && @chore.valid?
			redirect_to chore_path(@chore)
		else
			render new_chore_path
		end
	end

	def show
		@chore = Chore.find_by(id: params[:id])
		respond_to do |format|
      		format.html { render :show }
      		format.json { render json: @chore }
    	end
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
