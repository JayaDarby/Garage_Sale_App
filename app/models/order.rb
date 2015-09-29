class Order < ActiveRecord::Base
	has_many :items
	before_create :set_order_status
	before_save :update_subtotal

	private
	  def update_subtotal
	  	self[:subtotal] = subtotal
	  end

	  def subtotal
	  	items.collect{ |item| }.sum
	  end

	  def set_order_status
	  	self.order_status = 'In Progress'
	  end
end


