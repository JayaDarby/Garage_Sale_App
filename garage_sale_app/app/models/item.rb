class Item < ActiveRecord::Base
	belongs_to :garage_sale
	has_many :duration_times
end
