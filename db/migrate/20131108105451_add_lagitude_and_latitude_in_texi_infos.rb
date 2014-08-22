class AddLagitudeAndLatitudeInTexiInfos < ActiveRecord::Migration
  def change
  	add_column :texi_infos, :longitude, :float
  	add_column :texi_infos, :latitude, :float
  end
end
