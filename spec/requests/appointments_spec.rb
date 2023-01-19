require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  describe "POST /appointments" do
    let(:category) { create(:category) }
    let(:doctor) { create(:doctor, category: category) }
    let(:patient) { create(:patient) }
    let(:appointment_attrs) do
      FactoryBot.attributes_for(:appointment).merge(
        doctor_id: doctor.id,
        patient_id: patient.id
      )
    end

    before do
      sign_in patient
    end

    context "with valid attrs" do
      it "creates appointment" do
        post appointments_path, params: { appointment: appointment_attrs }

        expect(response).to redirect_to appointment_path(Appointment.last)
        expect(Appointment.count).to eq 1
        expect(Appointment.last.attributes).to include(appointment_attrs.stringify_keys)
      end
    end
  end
end
