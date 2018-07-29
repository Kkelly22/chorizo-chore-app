class Chore < ApplicationRecord
	belongs_to :household
	belongs_to :user
	has_many :completions

end
