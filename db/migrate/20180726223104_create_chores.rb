class CreateChores < ActiveRecord::Migration[5.2]
  def change
    create_table :chores do |t|
    	t.string :description
    	t.string :due_date
    	t.integer :point_value

      t.timestamps
    end
  end
end
