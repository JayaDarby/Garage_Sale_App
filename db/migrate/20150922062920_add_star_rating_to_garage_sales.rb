class AddStarRatingToGarageSales < ActiveRecord::Migration
  def change
  	add_column :garage_sales, :star_rating, :decimal
  	add_column :garage_sales, :num_ratings, :integer
  end
end
