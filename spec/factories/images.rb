FactoryGirl.define do
  factory :image do
    url { Faker::Internet.url }
    caption { Faker::Lorem.sentence }
    vehicle
  end
end
