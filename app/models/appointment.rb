class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :title, presence: true

  # states
  NEW = "new"
  COMPLETED = "completed"

  def completed?
    status == COMPLETED
  end
end
