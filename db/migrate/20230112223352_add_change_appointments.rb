class AddChangeAppointments < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :status, :string, default: "new"
    add_column :appointments, :title, :string
  end
end
