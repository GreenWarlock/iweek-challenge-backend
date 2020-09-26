class BusinessesController < ApplicationController
  before_action :set_business, only: [:update, :destroy]

  # GET /businesses
  def index
    @businesses = Business.select("*, NULL AS photos, NULL AS category_name").where(:active => true)
    @businesses.each { |business| 
    photos = []
    list = BusinessPhoto.select(:id, :photo_url).where(:business_id => business[:id], :active => true)
    list.each { |url|
      photos.push(url.photo_url)
    }
    business[:photos] = photos
    category_name = Category.select(:title).where(:id => business[:category_id]).first
    business[:category_name] = category_name.title
   }

    render json: @businesses
  end

  # GET /businesses/1
  def show
    business = Business.select("*, NULL AS photos, NULL AS category_name").where(:id => params[:id]).first
    photos = []
    list = BusinessPhoto.select(:id, :photo_url).where(:business_id => business.id, :active => true)
    list.each { |url|
      photos.push(url.photo_url)
    }
    business.photos = photos
    category_name = Category.select(:title).where(:id => business.category_id).first
    business.category_name = category_name.title

    render json: business
  end

  # GET /businesses/1/get_photos
  def get_photos
    @photos = BusinessPhoto.where(:business_id => params[:id])
    render json: @photos
  end

  # POST /businesses
  def create
    @business = Business.new(business_params)

    if @business.save
      render json: @business, status: :created, location: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /businesses/1
  def update
    if @business.update(business_params)
      render json: @business
    else
      render json: @business.errors, status: :unprocessable_entity
    end
  end

  # DELETE /businesses/1
  #def destroy
  #  @business.destroy
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_params
      params.require(:business).permit(:name, :category_id, :information, :latitude, :longitude, :cm_certification, :ratings, :active)
    end
end
