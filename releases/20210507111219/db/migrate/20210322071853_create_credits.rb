class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.string :undergraduate
      t.string :department
      t.string :class_name
      t.string :teacher_name
      t.string :fulfillment
      t.string :ease
      t.string :attendance
      t.string :mid_test_format
      t.string :final_test_format
      t.string :item
      t.string :textbook
      t.text :comment

      t.timestamps
    end
  end
end
