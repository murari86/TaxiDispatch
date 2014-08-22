class AddPassengerColumnToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :passenger_name, :string
  	add_column :bookings, :passenger_phone_no, :string
  	add_column :bookings, :passenger_email, :string
  end
end
