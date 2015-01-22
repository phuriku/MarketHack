class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { :case_sensitive => false }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
