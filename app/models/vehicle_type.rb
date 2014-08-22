class VehicleType < ActiveRecord::Base
  has_many :texi_infos
  attr_accessible :vehicle_type, :vehicle_rate
end
