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
        @picture = Picture.find(params[:id])
        render json: @item, status: :ok
    end
end