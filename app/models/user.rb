class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, uniqueness: true

  def doctor?
    type == 'Doctor'
  end

  def patient?
    type == 'Patient'
  end
end
