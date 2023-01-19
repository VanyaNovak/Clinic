FactoryBot.define do
  factory :appointment do
    title { Faker::Lorem.word }
    recommendation { nil }

    association :patient_id, factory: :patient
    association :doctor_id, factory: :doctor

  end
end