class GarageSalesApiController < ApplicationController
	def index
		@garage_sales = GarageSale.all
	   	render json: @garage_sales, status: :ok
	end

	def show
		@garage_sale = GarageSale.find(params[:id])
    	render json: @garage_sale, status: :ok   
	end
end
