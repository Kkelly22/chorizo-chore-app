class Completion < ApplicationRecord
	belongs_to :user
	belongs_to :chore

	def user_name=(name)
      self.user = User.find_by(name: name)
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

    def update
        self.completed = true
        self.save
    end

    def self.pending
        where(completed: false)
    end

    def self.past_due
        where(completed: false)
    end
	
end
