class PickupAddress < ActiveRecord::Base

	belongs_to :bookings
	geocoded_by :address
	after_validation :geocode

	attr_accessible :address, :longitude, :latitude, :booking_id
end
