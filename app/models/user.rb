class User < ApplicationRecord
	belongs_to :holdhold
	has_many :chores
	has_many :completions
end
