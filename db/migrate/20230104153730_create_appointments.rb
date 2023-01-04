class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :status
      t.text :recommendation
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
