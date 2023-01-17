class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_one_attached :avatar

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/ }

  def doctor?
    type == 'Doctor'
  end

  def patient?
    type == 'Patient'
  end

  def display_avatar
    if avatar.attached?
      avatar
    else
      'avatar.png'
    end
  end
end
