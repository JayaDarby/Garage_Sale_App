class AddGarageSaleToPictures < ActiveRecord::Migration
  def change
  	add_reference :pictures, :garage_sale, index: true, foreign_key: true
  end
end

