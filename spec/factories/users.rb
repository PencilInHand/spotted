FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    pass = Faker::Internet.password
    password { pass }
    password_confirmation { pass }
  end
end
