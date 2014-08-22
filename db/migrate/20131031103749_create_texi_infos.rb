class CreateTexiInfos < ActiveRecord::Migration
  def change
    create_table :texi_infos do |t|
    	t.string :texi_no
    	t.string :driver_name
    	t.string :address
    	t.string :city
    	t.string :zipcode
    	t.string :country
      t.timestamps
    end
  end
end
