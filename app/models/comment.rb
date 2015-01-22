class Comment < ActiveRecord::Base
  belongs_to :ticker
  validates :ticker_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :stock_price, presence: true
end
