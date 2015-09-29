class PicturesController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    @pictures = Picture.all


    respond_to do |format|
      binding.pry
      format.html # index.html.erb
      format.json { render json: @pictures.map{|upload| upload.to_jq_upload } }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @picture = Picture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @picture = Picture.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /uploads/1/edit
  def edit
    @picture = Picture.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @picture = Picture.create(params[:upload])
    binding.pry
    respond_to do |format|
      if @picture.save
        binding.pry
        format.html {
          render :json => [@picture.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        #format.json { render json: {files: [@picture.to_jq_upload]}, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:upload])
        format.html { redirect_to @picture, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end