class AddNameAndPickupTimeToItems < ActiveRecord::Migration
  def change
  	add_column :items, :name, :text
  	add_column :items, :pickup_time, :timestamp
  end
end
