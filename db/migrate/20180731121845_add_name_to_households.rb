class AddNameToHouseholds < ActiveRecord::Migration[5.2]
  def change
  	add_column :households, :name, :string
  end
end
