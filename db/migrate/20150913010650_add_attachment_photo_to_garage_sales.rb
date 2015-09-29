class AddAttachmentPhotoToGarageSales < ActiveRecord::Migration
  def self.up
    change_table :garage_sales do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :garage_sales, :photo
  end
end
