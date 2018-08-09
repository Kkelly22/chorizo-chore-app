class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
    	t.string :description
    	t.integer :point_value
    	t.integer :household_id

      t.timestamps
    end
  end
end
