class RemovePickupTimeFromItems < ActiveRecord::Migration
  def change
  	remove_column :items, :pickup_time
  end
end
