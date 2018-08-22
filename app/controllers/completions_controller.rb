class CompletionsController < ApplicationController
	layout "users"

	def index
		@completions = current_user.completions.pending
	end

	def new
		@chore = Chore.find_by(id: params[:chore_id])
		@completion = Completion.new
	end

	def create
		chore = Chore.find_by(id: params['completion'][:chore_id])
		user = User.find_by(name: params['completion'][:user_name])

		if !user
			redirect_to chore_path(params["completion"][:chore_id])
			flash[:error] = "Oops, user does not exist yet."
		elsif !user.households.include?(chore.household)
			redirect_to chore_path(params["completion"][:chore_id])
			flash[:error] = "User must join household first."
		else
			@completion = Completion.create(completion_params)
			if !@completion.errors.empty?
				redirect_to chore_path(params["completion"][:chore_id])
				flash[:error] = "Oops, something went wrong."
			else
				redirect_to user_path(@completion.user)
			end
		end
	end

	def complete
		@completion = Completion.find_by(id:params[:completion_id])
		if @completion
			@completion.update
			@user = @completion.user
			@user.update(@completion)
		end
		redirect_to user_path(current_user)
	end

	def destroy
		@completion = Completion.find_by(id: params[:completion_id])
		@completion.destroy
		redirect_to user_path(current_user)
	end

	def pastdue
		@past_dues = Completion.past_due
		render :pastdue
	end



	private

	def completion_params
		params.require(:completion).permit(:chore_id, :user_name, :due_date)
	end

end