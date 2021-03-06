class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :email
    	t.string :password_digest
    	t.string :image
    	t.integer :roommate_rating, :default => 0
    	t.integer :points_earned, :default => 0

      t.timestamps
    end
  end
end
