class AddHasItemsForSaleToGarageSales < ActiveRecord::Migration
  def change
  	add_column :garage_sales, :has_items, :boolean
  end
end
