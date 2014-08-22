class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :update_password_date, :date
  end
end
