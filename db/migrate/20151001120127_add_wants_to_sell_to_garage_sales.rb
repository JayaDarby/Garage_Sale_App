class AddWantsToSellToGarageSales < ActiveRecord::Migration
  def change
  	add_column :garage_sales, :wants_to_sell, :boolean
  end
end
