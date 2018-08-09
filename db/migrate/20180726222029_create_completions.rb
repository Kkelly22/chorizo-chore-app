class CreateCompletions < ActiveRecord::Migration[5.2]
  def change
    create_table :completions do |t|
    	t.integer :user_id
    	t.integer :chore_id
    	t.string :due_date
    	t.boolean :completed, :default => false

      t.timestamps
    end
  end
end
