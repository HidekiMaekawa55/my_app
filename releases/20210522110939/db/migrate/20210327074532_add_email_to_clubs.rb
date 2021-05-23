class AddEmailToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :email, :string
  end
end
