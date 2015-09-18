class ApiController < ApplicationController
	def index
    	@garage_sales = GarageSale.all
    	puts params
    	render json: @garage_sales, status: :ok
    end

    def show
    	@garage_sale = GarageSale.find(params[:id])
    	render json: @garage_sale, status: :ok   
    end
end
