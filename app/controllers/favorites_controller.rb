class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /favorites
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1
  def show
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit
  end

  # POST /favorites
  def create
    @favorite = current_user.favorites.build(favorite_params)
    #@favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to @favorite, notice: 'Favorite was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /favorites/1
  def update
    if @favorite.update(favorite_params)
      redirect_to @favorite, notice: 'Favorite was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /favorites/1
  def destroy
    @favorite.destroy
    redirect_to favorites_url, notice: 'Favorite was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_params
      params.require(:favorite).permit(:place1, :place2, :place3, :user_id)
    end
end
