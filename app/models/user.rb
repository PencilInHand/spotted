class User < ActiveRecord::Base
  has_secure_password
  has_many :vehicles

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
