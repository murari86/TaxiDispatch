class CreateVehiclePreferences < ActiveRecord::Migration
  def change
    create_table :vehicle_preferences do |t|
      t.integer :booking_id
      t.integer :vehicle_type_id
      t.integer :number_of_vehicle
      t.timestamps
    end
  end
end
