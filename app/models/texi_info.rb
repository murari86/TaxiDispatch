class TexiInfo < ActiveRecord::Base
  belongs_to :vehicle_types
	geocoded_by :address
	after_validation :geocode
  has_many :bookings
  attr_accessible :texi_no, :driver_name, :address, :city, :zipcode, :country, :longitude, :latitude
  
end
