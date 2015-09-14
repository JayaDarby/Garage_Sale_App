class User < ActiveRecord::Base
	has_many :garage_sales, dependent: :destroy
	
end
