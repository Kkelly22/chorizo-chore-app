class Household < ApplicationRecord
	has_many :users
	has_many :chores
	
	def user_name=(name)
    	self.user = User.find_or_create_by(name: name)
 	end

  	def user_name
    	self.user ? self.user.name : nil
  	end

end
