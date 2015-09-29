class AddFullAdressToGarageSales < ActiveRecord::Migration
  def change
  	add_column :garage_sales, :full_address, :string
  end
end
