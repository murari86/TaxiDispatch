class AddViehicleTypeColumnToTaxiInfos < ActiveRecord::Migration
  def change
    add_column :texi_infos, :vehicle_type_id, :integer
  end
end
