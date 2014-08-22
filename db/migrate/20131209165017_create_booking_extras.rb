class CreateBookingExtras < ActiveRecord::Migration
  def change
    create_table :booking_extras do |t|
      t.string :extras
      t.integer :vehicle_type_id
      t.timestamps
    end
  end
end
