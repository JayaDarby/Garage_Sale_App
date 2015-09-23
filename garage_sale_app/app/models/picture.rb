class Picture < ActiveRecord::Base
	belongs_to :garage_sale
	has_attached_file :image
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	include Rails.application.routes.url_helpers

	def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => image.url(:original),
      "delete_url" => picture_path(self),
      "delete_type" => "DELETE" 
    }
  end
end
