class VehiclePreference < ActiveRecord::Base
  belongs_to :bookings
  attr_accessible :number_of_vehicle, :booking_id, :vehicle_type_id

end
