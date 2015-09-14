class GarageSalesController < ApplicationController
  def index
    if params[:user_id]
  	  @user_garage_sales = GarageSale.where(user_id: params[:user_id])
  	end
  end

  def show
  	@garage_sale = GarageSale.where(id: params[:id])[0]
  	@user = User.where(id: params[:user_id])
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
  	end
  end

  def create
  	@user = User.find_by_id(params[:user_id])
  	@garage_sale = @user.garage_sales.create(garage_sale_params)
  	@garage_sale.full_address = @garage_sale.address.to_s + ', ' + @garage_sale.city.to_s + ', ' + @garage_sale.state.to_s + ' ' + @garage_sale.zip_code.to_s
  	if @garage_sale.save
  		redirect_to user_garage_sale_path(@user, @garage_sale), flash:{success:'Garage sale successfully created!'}
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
			:photo
		)
	end
end
