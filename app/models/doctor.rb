class Doctor < User
  has_many :appointments, dependent: :destroy
  belongs_to :category

  def category_name
    category.title.delete_suffix("s")
  end

  def busy?
    appointments.where(status: Appointment::NEW).count >= 10
  end
end
