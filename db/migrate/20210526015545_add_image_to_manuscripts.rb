class AddImageToManuscripts < ActiveRecord::Migration[6.0]
  def change
    add_column :manuscripts, :image, :string
  end
end
