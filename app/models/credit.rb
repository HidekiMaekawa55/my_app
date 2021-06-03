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
  
  def Credit.word_split(word)
    word.gsub(/　/," ").lstrip.split(/[[:blank:]]+/)
  end
  
  def Credit.search_format(teacher_name, class_name)
    where('teacher_name Like ? and class_name Like ?', "%#{teacher_name}%", "%#{class_name}%")
  end
  
  def Credit.target(teacher_name, class_name)
    Credit.search_format(teacher_name, class_name).change_order('created_at')
  end
  
  def Credit.word_search(words)
    searches = Credit.search_format(words[0], words[1])
    searches.blank? ? Credit.search_format(words[1], words[0]) : searches
  end
  
  def Credit.change_order(column)
    order("#{column} DESC")
  end
  
end
