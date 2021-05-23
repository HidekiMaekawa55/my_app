class AddColumnsToClubs < ActiveRecord::Migration[6.0]
  def change
    add_column :clubs, :content, :text
    add_column :clubs, :date, :string
    add_column :clubs, :member, :string
    add_column :clubs, :place, :string
    add_column :clubs, :league, :string
  end
end
