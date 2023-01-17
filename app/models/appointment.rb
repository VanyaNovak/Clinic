class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :title, presence: true, uniqueness: true
  validate :validate_appointments

  # states
  NEW = "new"
  COMPLETED = "completed"

  def completed?
    status == COMPLETED
  end
  def validate_appointments
    errors.add(:appointments, "Too much Appointments, Doctor is busy") if Appointment.where(status: Appointment::NEW, doctor_id: doctor_id).count >= 10
  end
end
