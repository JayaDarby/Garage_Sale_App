class ApiController < ApplicationController
	def index
		puts 'heiiiiiiiiiiiiiiiiiiiiiiii'
		puts params
		if params[:garage_sales]
    		@garage_sales = GarageSale.all
	   		render json: @garage_sales, status: :ok
	   	elsif params[:garage_sales]
	   		@items = Items.all
        	render json: @items, status: :ok
        end

    end

    def show
    	if params[:garage_sales]
    		@garage_sale = GarageSale.find(params[:id])
    		render json: @garage_sale, status: :ok   
    	elsif params[:items]
        	@item = Items.find(params[:id])
        	render json: @item, status: :ok
        end
    end
end
