class HouseholdUsers < ActiveRecord::Migration[5.2]
  def change
  	create_table :household_users do |t|
    	t.integer :household_id
    	t.integer :user_id
    end
  end
end
