class ItemsController < ApplicationController
  def index
  	 @user = User.find_by_id(params[:user_id])
  	 @garage_sale = GarageSale.find_by_id(params[:garage_sale_id])
     @items = Item.all
  end

  def new
  	 @user = User.find_by_id(params[:user_id])
  	 @garage_sale = GarageSale.find_by_id(params[:garage_sale_id])
     @item = Item.new
  end

  def create
  end

  def show
      @item = Item.find_by_id(params[:id])
  end

  def edit
  end
end
