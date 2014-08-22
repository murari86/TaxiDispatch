class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :vehicle_type
      t.float :vehicle_rate
      t.timestamps
    end
  end
end
