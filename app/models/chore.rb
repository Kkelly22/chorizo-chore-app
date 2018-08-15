class Chore < ApplicationRecord
	has_many :completions
	has_many :users, through: :completions
	belongs_to :household

	validates :description, 
          :presence => {:message => "Description can't be blank." }

  def household_name=(name)
    self.household = Household.find_by(name: name)
  end

  def household_name
    self.household ? self.household.name : nil
  end

end
