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
        return "Excellent"
      elsif self.points_earned >= 40
        return "Strong"
      elsif self.points_earned >= 30
        return "Mediocre"
      elsif self.points_earned >= 20
        return "Weak"
      else
        return "Do More"
      end
    end

    def all_household_chores
      all_chores = []
      self.households.each do |household|
        household.chores.each do |chore|
          all_chores << chore
        end 
      end
      all_chores
    end

    def update(completion)
      self.points_earned += completion.chore.point_value
      self.save
    end


    def self.find_or_create_by_omniauth(auth_hash)
      self.where(:email => auth_hash['info']['email']).first_or_create do |user|
        user.name = auth_hash['info']['name']
        user.password = SecureRandom.hex
      end
    end


end
