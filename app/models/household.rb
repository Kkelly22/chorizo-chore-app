class Household < ApplicationRecord
	has_many :household_users
  	has_many :users, through: :household_users

	has_many :chores

	validates :name, 
          :presence => {:message => "Household Name can't be blank." }

end
