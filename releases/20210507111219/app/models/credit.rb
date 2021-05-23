class Credit < ApplicationRecord
  validates :undergraduate, presence: true
  validates :department, presence: true
  validates :class_name, presence: true
  validates :teacher_name, presence: true
  validates :fulfillment, presence: true
  validates :ease, presence: true
  validates :attendance, presence: true
  validates :mid_test_format, presence: true
  validates :final_test_format, presence: true
  validates :item, presence: true
  validates :textbook, presence: true
  validates :comment, presence: true
end
