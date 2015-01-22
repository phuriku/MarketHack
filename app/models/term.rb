class Term < ActiveRecord::Base
  validates :name, presence: true
end
