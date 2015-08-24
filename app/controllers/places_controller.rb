class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /places
  def index
    @places = Place.all
  end

  # GET /places/1
  def show
    @checks = Check.where(place_id: @place.id).order("created_at DESC")
  end

  # GET /places/new
  def new
    @place = current_user.places.build
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  def create
    @place = current_user.places.build(place_params)
    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to places_url, notice: 'Place was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find_by(id: params[:id])
    end

    def correct_user
      @place = current_user.places.find_by(id: params[:id])
      redirect_to places_path, notice: "Not authorized to edit this place" if @place.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name)
    end
end
