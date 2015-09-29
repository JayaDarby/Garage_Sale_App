class DurationTime < ActiveRecord::Base
	belongs_to :garage_sale
	belongs_to :item
end
