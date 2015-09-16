class AddGarageSaleToGarageDateTimes < ActiveRecord::Migration
  def change
  	add_reference :garage_date_times, :garage_sale, index: true, foreign_key: true
  end
end
