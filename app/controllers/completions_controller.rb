class CompletionsController < ApplicationController
	layout "users"

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



	private

	def completion_params
		params.require(:completion).permit(:chore_id, :user_name, :due_date)
	end

end