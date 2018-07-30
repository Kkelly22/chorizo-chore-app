class User < ApplicationRecord
	belongs_to :holdhold
	has_many :chores
	has_many :completions

	has_secure_password
	
	validates :name, 
          :presence => {:message => "Name can't be blank." },
          :uniqueness => {:message => "Title already exists."}

    validates :email, 
          :presence => {:message => "Email can't be blank." },
          :uniqueness => {:message => "Email already exists."}

    validates :password, 
          :presence => {:message => "Password can't be blank." }
end
