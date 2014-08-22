class AddTaxiinfoidInBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :taxi_info_id, :integer
  end
end
