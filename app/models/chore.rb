class Chore < ApplicationRecord
	belongs_to :user
  belongs_to :household
	has_many :completions

  def household_name=(name)
    self.household = Household.find_or_create_by(name: name)
  end

  def household_name
    self.household ? self.household.name : nil
  end

  def user_name=(name)
    self.user = User.find_or_create_by(name: name)
  end

  def user_name
    self.user ? self.user.name : nil
  end

end
