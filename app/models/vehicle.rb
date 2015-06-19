require 'open-uri'

class Vehicle < ActiveRecord::Base
  belongs_to :user
  has_many :modifications
  has_many :images
  has_one :time_card
  has_one :profile_image, class_name: 'Image'

  validates :user, presence: true
  validates :vin, uniqueness: true

  before_create :attributes_from_vin

  scope :belonging_to_user, ->(user_id) {
    where(user_id: user_id)
  }

  def attributes_from_vin
    if vin
      api_url = ENV['EDMUNDS_API_URL_BASE'] + ENV['EDMUNDS_FULL_DETAILS_BY_VIN_URL']
      full_url = api_url + self.vin + '?fmt=json&api_key=' + ENV['EDMUNDS_API_KEY']
      self.edmunds_json = JSON.load(open(full_url))
    else
      true
    end
  rescue OpenURI::HTTPError
    true
  end
end
