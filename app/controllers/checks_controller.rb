class ChecksController < ApplicationController
  before_action :set_check, only: [:show, :edit, :update, :destroy]
  #before_action :set_place
  before_action :authenticate_user!, except: [:index, :show]

  # GET /checks
  def index
    @checks = Check.all
  end

  # GET /checks/1
  def show
  end

  # GET /checks/new
  def new
    @check = current_user.checks.build
  end

  # GET /checks/1/edit
  def edit
  end

  # POST /checks
  def create
    @check = current_user.checks.build(check_params)
    #@check.place_id = @place.id
    if @check.save
      redirect_to checks_path, notice: 'Check was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /checks/1
  def update
    if @check.update(check_params)
      redirect_to checks_path, notice: 'Check was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /checks/1
  # DELETE /checks/1.json
  def destroy
    @check.destroy
    redirect_to root_path, notice: 'Check was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check
      @check = Check.find(params[:id])
    end

    #def set_place
    #  @place = Place.find(params[:place_id])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_params
      params.require(:check).permit(:place_id, :comment, :guide)
    end
end
