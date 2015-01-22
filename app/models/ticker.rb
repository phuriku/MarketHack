class Ticker < ActiveRecord::Base
  validates :symbol, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :sector, presence: true
  validates :price, presence: true
  validates :daily_change, presence: true
  validates :market_cap, presence: true
  validates :volume, presence: true
  validates :mov_avg_50, presence: true
  validates :mov_avg_50_cmp, presence: true
  validates :high_52, presence: true
  validates :high_52, presence: true

  has_many :comments

  def self.search(query)
    where("symbol ilike ? or name ilike ?", "%#{query}%", "%#{query}%")
  end
end
