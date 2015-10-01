class AddItemToDurationTime < ActiveRecord::Migration
  def change
  	add_reference :duration_times, :item, index: true, foreign_key: true
  end
end
