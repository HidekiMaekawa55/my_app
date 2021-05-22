class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :club_id

      t.timestamps
      
      t.index :club_id
    end
  end
end
