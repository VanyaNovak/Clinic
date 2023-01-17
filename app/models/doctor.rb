class Doctor < User
  has_many :appointments, dependent: :destroy
  belongs_to :category

  def category_name
    category.title.delete_suffix("s")
  end
end
