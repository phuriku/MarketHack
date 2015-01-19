class Ticker < ActiveRecord::Base
  has_many :comments
  def self.search(query)
    where("symbol ilike ? or name ilike ?", "%#{query}%", "%#{query}%")
  end
end
