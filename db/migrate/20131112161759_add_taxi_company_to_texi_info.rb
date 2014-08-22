class AddTaxiCompanyToTexiInfo < ActiveRecord::Migration
  def change
  add_column :texi_infos, :taxi_company_name, :string
  add_column :texi_infos, :taxi_company_phone_no, :string
  end
end
