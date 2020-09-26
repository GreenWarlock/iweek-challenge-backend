class BusinessPhotosController < ApplicationController
  before_action :set_business_photo, only: [:show, :update, :destroy]

  # GET /business_photos
  def index
    @business_photos = BusinessPhoto.all

    render json: @business_photos
  end

  # GET /business_photos/1
  def show
    render json: @business_photo
  end

  # POST /business_photos
  def create
    @business_photo = BusinessPhoto.new(business_photo_params)

    if @business_photo.save
      render json: @business_photo, status: :created, location: @business_photo
    else
      render json: @business_photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business_photos/1
  def update
    if @business_photo.update(business_photo_params)
      render json: @business_photo
    else
      render json: @business_photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /business_photos/1
  #def destroy
  #  @business_photo.destroy
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_photo
      @business_photo = BusinessPhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_photo_params
      params.require(:business_photo).permit(:business_id, :photo_url, :active)
    end
end
