class GarageSale < ActiveRecord::Base
	belongs_to :user
	has_attached_file :photo, :styles => { :small => '300x300>'}
  	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  	has_many :pictures, :dependent => :destroy
  	has_many :duration_times, :dependent => :destroy
  	has_many :items
  	accepts_nested_attributes_for :duration_times, :reject_if => lambda { |a| a[:date].blank? }
  	accepts_nested_attributes_for :pictures, :allow_destroy => true
end
