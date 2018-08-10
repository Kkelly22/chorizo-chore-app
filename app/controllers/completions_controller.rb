class CompletionsController < ApplicationController
	layout "users"

	def index
		@completions = current_user.completions.all
	end

	def new
		@chore = Chore.find_by(params[:chore_id])
		@completion = Completion.new
	end

	def create
		@completion = Completion.create(completion_params)
		if @completion
			redirect_to root_path
		else
			redirect_to new_completion_path
		end
	end

	def complete
		@completion = Completion.find_by(id:params[:completion_id])
		if @completion
			@completion.completed = true
			@completion.save

			@user = @completion.user
			@user.points_earned += @completion.chore.point_value
			@user.save
		end
		redirect_to root_path
	end



	private

	def completion_params
		params.require(:completion).permit(:chore_id, :user_name, :due_date)
	end

end