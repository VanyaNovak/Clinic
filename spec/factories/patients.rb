FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::Number.number(digits: 10) }
    password { "somepass" }
  end
end