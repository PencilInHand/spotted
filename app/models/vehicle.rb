class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :modifications
  has_many :images
  has_one :time_card

  validates :user, presence: true
  validates :vin, uniqueness: true

  def get_attributes_from_vin
    # TODO(millidavids): Either here, or via javascript, get the attributes
  end
end
