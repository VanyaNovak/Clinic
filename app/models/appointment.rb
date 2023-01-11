class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  # states
  NEW = "New"
  COMPLETED = "Completed"

  def completed_appointment?
    status == COMPLETED
  end

  def new_appointment?
    status == NEW
  end
end
