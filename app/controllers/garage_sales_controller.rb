class GarageSalesController < ApplicationController
  def index
    if params[:user_id]
  	  @user_garage_sales = GarageSale.where(user_id: params[:user_id]);
  	end
  end

  def show
  	@garage_sale = GarageSale.where(id: params[:id])[0]
  	@user = User.where(id: params[:user_id])
    @items = Item.where(garage_sale_id: @garage_sale.id)

  end


  def edit
  	if params[:user_id]
  		@garage_sale = GarageSale.where(id: params[:id])[0]
  		@user = User.find_by_id(params[:user_id])
  	end
  end

  def new
  	if params[:user_id]
  	  @user = User.find_by_id(params[:user_id])
  	  @garage_sale = @user.garage_sales.new
      3.times { @garage_sale.duration_times.build }
      @picture = @garage_sale.pictures.new
  	end
  end

  def create
  	@user = User.find_by_id(params[:user_id])
  	@garage_sale = @user.garage_sales.create(garage_sale_params)
  	@garage_sale.full_address = @garage_sale.address.to_s + ', ' + @garage_sale.city.to_s + ', ' + @garage_sale.state.to_s + ' ' + @garage_sale.zip_code.to_s
    @garage_sale.image_url = 'http://www.visitscotland.com/cms-images/2x1/regions/aberdeen-shire/fyvie-castle'

  	if @garage_sale.save
        # puts 'THE PARAMS IMAGE IS'
        # puts params[:image]
        # params[:image].each do |picture|      
        #   @garage_sale.pictures.create(:image=> picture)
        #   # Don't forget to mention :avatar(field name)
        # end
         if @garage_sale.wants_to_sell == true
           redirect_to new_user_garage_sale_item_path(@user, @garage_sale)
         else
  		     flash[:notice] = 'Successfully checked in'
          redirect_to home_path
         end
       #user_garage_sale_path(@user, @garage_sale), flash:{success:'Garage sale successfully created!'}
  	else
  		render :new
  	end
  end

  def update
  	if params[:user_id]
  		@user = User.find_by_id(params[:user_id])
  		@garage_sale = GarageSale.where(id: params[:id])[0]
  		@garage_sale.update(garage_sale_params)
  	  	if @garage_sale.update(garage_sale_params)
  			redirect_to user_garage_sale_path(@user, @garage_sale), flash:{success:'Garage sale successfully updated!'}
  		else
  			render :edit
  		end
  	end
  end

  def destroy
  		@garage_sale = GarageSale.where(id: params[:id])[0]
  		@garage_sale.destroy
  		@user = User.find_by_id(params[:user_id])
  		@garage_sales = GarageSale.where(user_id: params[:user_id])
  		redirect_to user_garage_sales_path(@garage_sale.user_id, @garage_sales), flash:{success:'Garage sale successfully deleted!'}
  end

private
	def garage_sale_params
		params.require(:garage_sale).permit(
			:title,
			:address,
			:city,
			:state,
			:zip_code,
			:description,
			:phone_number,
      :email,
      :can_text,
      :can_call,
      :can_email,
      :wants_to_sell,
      :image,
      duration_times_attributes: [:date, :start_time, :end_time],
		)
	end
end

# class GarageSalesController < ApplicationController
#   before_action :set_garage_sale, only: [:show, :update, :destroy]
#   #before_action :html_layout, only:[:new]

#   # GET /garage_sales
#   def index
#     @garage_sales = GarageSale.all
#     puts params
#     render json: @garage_sales, status: :ok
#   end

#   # GET /garage_sales/1
#   def show
#     render json: @garage_sale, status: :ok   
#   end

#   # POST /garage_sales
#   def create
#     @garage_sale = GarageSale.new(garage_sale_params)

#     if @garage_sale.save
#       render json: @garage_sale, status: :created
#     else
#       render json: @garage_sale.errors, status: :unprocessable_entity
#     end
#   end

#   # PATCH/PUT /garage_sales/1
#   def update
#     if @garage_sale.update(garage_sale_params)
#       render json: @garage_sale, status: :ok
#     else
#       render json: @garage_sale.errors, status: :unprocessable_entity
#     end
#   end

#   # DELETE /garage_sales/1
#   def destroy
#     @garage_sale.destroy
#     render json: @garage_sale, status: ok
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_garage_sale
#       @garage_sale = GarageSale.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def garage_sale_params
#       params.require(:garage_sale).permit(:name, :email, :phone)
#     end
# end

