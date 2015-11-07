class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :vehicles

  validates :name, presence: true
end
