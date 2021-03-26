class Club < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
