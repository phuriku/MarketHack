class Ticker < ActiveRecord::Base
  has_many :comments
end
