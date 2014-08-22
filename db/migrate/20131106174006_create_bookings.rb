class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.string :pickup_address
      t.string :dropoff_address
      t.string :via_address
      t.integer :number_of_bags, :default => 0, :null => false
      t.integer :number_of_passengers, :default => 0, :null => false
      t.integer :booked_hours
      t.string :flight_info
      t.integer :recurrent_type, :default => 1, :null => false
      t.datetime :pickup_datetime
      t.datetime :return_pickup_datetime
      
      t.timestamps
    end
  end
end
