class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy, :gallery]
  before_action :set_vehicles, only: [:index]
  before_action :set_images, only: [:gallery]
  before_action :set_user

  respond_to :html, :json

  # GET /vehicles
  # GET /vehicles.json
  def index
    respond_with @vehicles
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    respond_with @vehicle
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    respond_with @vehicle
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = @user.vehicles.new(vehicle_params)
    if vehicle_params[:vin]
      @vehicle.attributes_from_vin
    end
    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to [@user, @vehicle], notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to @vehicle, notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /vehicle/1/gallery
  # GET /vehicle/1/gallery.json
  def gallery
    respond_with @vehicle, @images
  end

  private
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    def set_vehicles
      @vehicles = Vehicle.where(user_id: params[:user_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_images
      @images = Image.where(vehicle_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:vin, :user_id)
    end
end
