class PicturesApiController < ApplicationController
	def index
	   	@pictures = Picture.all
        render json: @items, status: :ok
    end

    def show
        @picture = Picture.find(params[:id])
        render json: @item, status: :ok
    end

    def create
        @picture.create(image_params)
        render json: @item, status: :ok
    end

    def create
    	@user = User.find_by_id(params[:user_id])
  		@picture = @user.garage_sales.create(garage_sale_params)
  		@garage_sale.full_address = @garage_sale.address.to_s + ', ' + @garage_sale.city.to_s + ', ' + @garage_sale.state.to_s + ' ' + @garage_sale.zip_code.to_s
  		if @garage_sale.save
  			redirect_to user_garage_sale_path(@user, @garage_sale), flash:{success:'Garage sale successfully created!'}
  		else
  			render :new
  		end
  	end

  	private
  		def image_params
  			
  		end
end