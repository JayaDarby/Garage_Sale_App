class PicturesApiController < ApplicationController
	  def index
	   	@pictures = Picture.all
        render json: @pictures, status: :ok
    end

    def show
        @picture = Picture.find(params[:id])
        render json: @picture, status: :ok
    end

  # def index
  #   @pictures = Picture.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @pictures.map{|picture| picture.to_jq_picture } }
  #   end
  # end

  # # GET /pictures/1
  # # GET /pictures/1.json
  # def show
  #   @picture = Picture.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @picture }
  #   end
  # end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = Picture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end


  # POST /pictures
  # POST /pictures.json

  def create
    @garage_sale = GarageSale.find(params[:garage_sale_id])

    params[:picture]['file']).each do |f|
      @picture = Picture.create!(:file => f, :garage_sale_id => @garage_sale.id)
    end
    
    redirect_to @garage_sale
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end


  	private
  		def image_params
  			 params.require(:picture).permit(
          :image_file_name, 
          :image_content_type,
          :image_file_size,
          :image_updated_at
        )
  		end
end