class Item < ActiveRecord::Base
	belongs_to :garage_sale
	has_many :duration_times
	accepts_nested_attributes_for :duration_times, :reject_if => lambda { |a| a[:date].blank? }
end
