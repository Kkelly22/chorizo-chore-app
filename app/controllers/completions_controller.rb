class CompletionsController < ApplicationController
	layout "users"

	def index
		if params[:user_id]
      		@completions = User.find(params[:user_id]).completions
      		@completion_index_header = "Your Completions"
    	else
      		@completions = Chore.all
      		@completion_index_header = "All Completions"
    	end
	end

	def new
		@completion = Completion.new
	end

	def create
		@completion = Completion.create(completion_params)
		if @completion
			redirect_to user_chores_path(current_user)
		else
			redirect_to user_chore_path(current_user, params[:chore_id])
		end
	end


	private

	def completion_params
		params.require(:completion).permit(:chore_id)
	end

end