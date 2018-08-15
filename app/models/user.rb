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


    def household_name=(name)
      self.household = Household.find_or_create_by(name: name)
    end

    def household_name
      self.household ? self.household.name : nil
    end

    def rating
      if self.points_earned >=50
        return 5
      elsif self.points_earned >= 40
        return 4
      elsif self.points_earned >= 30
        return 3
      elsif self.points_earned >= 20
        return 2
      else
        return 1
      end
    end


    def self.find_or_create_by_omniauth(auth_hash)
      self.where(:email => auth_hash['info']['email']).first_or_create do |user|
        user.name = auth_hash['info']['name']
        user.password = SecureRandom.hex
      end
    end


end
