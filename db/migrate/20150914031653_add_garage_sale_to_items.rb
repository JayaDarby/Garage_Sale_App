class AddGarageSaleToItems < ActiveRecord::Migration
  def change
  	add_reference :items, :garage_sale, index: true, foreign_key: true
  end
end
