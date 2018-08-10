class Completion < ApplicationRecord
	belongs_to :user
	belongs_to :chore

	def user_name=(name)
      self.user = User.find_or_create_by(name: name)
    end

    def user_name
      self.user ? self.user.name : nil
    end

    def status
    	if self.completed == true
    		return "Completed"
    	else
    		return "Not Completed"
    	end
    end
	
end
