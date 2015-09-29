class DateTime < ActiveRecord::Base
	belongs_to :garage_sale
	belongs_to :item
end
