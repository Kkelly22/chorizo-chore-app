class AddHouseholdidUseridToChores < ActiveRecord::Migration[5.2]
  def change
  	add_column :chores, :household_id, :integer
  	add_column :chores, :user_id, :integer
  end
end
