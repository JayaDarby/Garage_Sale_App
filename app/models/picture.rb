class Picture < ActiveRecord::Base
	belongs_to :garage_sale
  	has_attached_file :image
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	#include Rails.application.routes.url_helpers
	# def to_jq_picture
	#   {
	#     "name" => read_attribute(:image_file_name),
	#     "size" => read_attribute(:image_file_size),
	#     "url" => image.url(:original),
	#     # "delete_url" => image_path(self),
	#     # "delete_type" => "DELETE" 
	#   }
	# end

	 # def to_jq_upload
  #   {
  #     "file" => file,
  #     "file_name" => 'asdf',
  #     "url" => file.url,
  #     "delete_url" => id,
  #     "delete_type" => "DELETE"
  #   }
  # 	end
end
