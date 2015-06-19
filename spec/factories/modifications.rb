FactoryGirl.define do
  factory :modification do
    type { Faker::Lorem.word }
    manufacturer { Faker::Company.name }
    caption { Faker::Lorem.sentence }
    section { Faker::Lorem.word }
    vehicle
  end
end
