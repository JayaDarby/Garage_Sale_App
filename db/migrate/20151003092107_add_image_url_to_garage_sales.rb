class AddImageUrlToGarageSales < ActiveRecord::Migration
  def change
  	add_column :garage_sales, :image_url, :text
  end
end
