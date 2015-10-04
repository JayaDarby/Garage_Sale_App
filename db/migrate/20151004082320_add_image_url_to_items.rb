class AddImageUrlToItems < ActiveRecord::Migration
  def change
  	add_column :items, :image_url, :text
  end
end
