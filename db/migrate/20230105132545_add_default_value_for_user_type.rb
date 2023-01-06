class AddDefaultValueForUserType < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :type, :string, default: 'Patient'
  end
end
