class Doctor < User
  has_many :appointments, dependent: :destroy
  has_one :category
end
