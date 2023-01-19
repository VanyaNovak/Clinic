require "rails_helper"

Rspec.describe "Appointment management", type: :feature do
  let(:category) { create(:category) }
  let(:doctor) { create(:doctor, category: category) }
  let(:patient) { create(:patient) }
  let(:appointment) { create(:appointment, doctor: doctor, patient: patient) }

  it "puts recommendation for patient" do
    visit new_user_session_path
    within do
      fill_in 'Phone number', with: doctor.phone_number
      fill_in 'Password', with: "somepass"
    end
    click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end