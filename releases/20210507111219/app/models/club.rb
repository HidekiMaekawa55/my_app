class Club < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  
  def Club.list
    Club.all
  end
end
