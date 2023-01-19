require 'rails_helper'

RSpec.describe User, type: :model do
  let(:patient) { create(:patient) }

  it "creates user with valid attributes" do
    expect(patient).to be_valid
  end

  context "phone number validation" do
    context "with valid phone number" do
      subject { create(:patient, phone_number: "+380681234568") }

      it "does not create user" do
        expect(subject).to be_valid
      end
    end

    context "without phone number" do
      subject { create(:patient, phone_number: nil) }

      it "does not create user" do
        expect { subject }.to raise_error("Validation failed: Phone number can't be blank, Phone number is invalid")
      end
    end

    context "with invalid phone number" do
      subject { create(:patient, phone_number: Faker::Lorem.word) }

      it "does not create user" do
        expect { subject }.to raise_error("Validation failed: Phone number is invalid")
      end
    end
  end
end
