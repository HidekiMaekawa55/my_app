class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  def self.limit_order(number, column)
    limit(number).order("#{column} DESC")
  end
end
