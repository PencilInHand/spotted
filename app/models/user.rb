class User < ActiveRecord::Base
  has_many :vehicles

  validates :name, presence: true
  validates :email, presence: true
end
