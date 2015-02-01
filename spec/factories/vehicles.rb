FactoryGirl.define do
  factory :vehicle do
    user
    vin { SecureRandom.hex(17) }
  end
end
