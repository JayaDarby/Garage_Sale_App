class AddAddressDetailsToGarageSales < ActiveRecord::Migration
  def change
  	add_column :garage_sales, :city, :string
  	add_column :garage_sales, :state, :string
  	add_column :garage_sales, :zip_code, :integer
  end
end
