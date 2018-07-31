class AddHouseholdidToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :household_id, :integer
  end
end
