class AddRatingToGarageSales < ActiveRecord::Migration
  def change
  	add_column :garage_sales, :rating, :decimal
  end
end
