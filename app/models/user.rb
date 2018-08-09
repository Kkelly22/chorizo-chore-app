class User < ApplicationRecord
  has_many :household_users
  has_many :households, through: :household_users

	has_many :completions
	has_many :chores, through: :completions

	has_secure_password
	
	validates :name, 
          :presence => {:message => "Username can't be blank." },
          :uniqueness => {:message => "Username already exists."}

    validates :email, 
          :presence => {:message => "Email can't be blank." },
          :uniqueness => {:message => "Email already exists."}

    validates :password, 
          :presence => {:message => "Password can't be blank." }

    def household_name=(name)
      self.household = Household.find_or_create_by(name: name)
    end

    def household_name
      self.household ? self.household.name : nil
    end


end
