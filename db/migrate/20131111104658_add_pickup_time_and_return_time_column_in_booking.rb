class AddPickupTimeAndReturnTimeColumnInBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :pickup_time, :datetime
    add_column :bookings, :return_pickup_time, :datetime
  end
end
