class AddTimeColumnToBookings < ActiveRecord::Migration
  def change
#  	add_column :bookings, :pickup_time, :time
  	add_column :bookings, :dropoff_time, :time
  end
end
