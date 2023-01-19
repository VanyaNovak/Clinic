require "rails_helper"

RSpec.describe "Appointments", type: :feature do
  let(:category) { create(:category) }
  let(:doctor) { create(:doctor, category: category) }
  let(:patient) { create(:patient) }
  let(:appointment) { create(:appointment, doctor: doctor, patient: patient) }
  let(:recommendation) { Faker::Lorem.paragraph }

  before do
    sign_in doctor
  end

  it "puts recommendation for patient" do
    visit appointment_path(appointment)
    fill_in "Recommendation", with: recommendation
    click_on("Add recommendation")

    appointment.reload
    expect(appointment.recommendation).to eq recommendation
    expect(appointment.status).to eq Appointment::COMPLETED

    expect(page).to have_content(recommendation)
  end
end