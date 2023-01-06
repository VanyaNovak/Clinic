class RemoveDoctorIdFromCategoryAndAddCategoryIdToUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :doctor_id, :integer
    add_column :users, :category_id, :integer, default: nil
  end
end
