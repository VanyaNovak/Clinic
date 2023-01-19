FactoryBot.define do
  factory :appointment do
    title { Faker::Lorem.sentence }
    recommendation { nil }

    association :patient_id, factory: :patient
    association :doctor_id, factory: :doctor

  end
end