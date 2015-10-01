class AddGarageSaleToDurationTime < ActiveRecord::Migration
  def change
  	add_reference :duration_times, :garage_sale, index: true, foreign_key: true
  end
end
