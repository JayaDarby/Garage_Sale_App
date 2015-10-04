class AddFullAddressToItems < ActiveRecord::Migration
  def change
  	add_column :items, :full_address, :text
  end
end
