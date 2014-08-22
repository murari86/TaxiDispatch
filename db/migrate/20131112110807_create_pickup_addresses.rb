class CreatePickupAddresses < ActiveRecord::Migration
  def change
    create_table :pickup_addresses do |t|
    	t.string :address
    	t.float  :longitude
    	t.float  :latitude
    	t.integer :booking_id

      t.timestamps
    end
  end
end
