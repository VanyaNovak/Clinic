class Doctor < User
  has_many :appointments, dependent: :destroy
  belongs_to :category
end
