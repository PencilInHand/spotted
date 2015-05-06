class ModificationsController < ApplicationController
  before_action :set_modification, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  # GET /modifications
  # GET /modifications.json
  def index
    respond_with @modifications
  end

  # GET /modifications/1
  # GET /modifications/1.json
  def show
    respond_with @modification
  end

  # GET /modifications/new
  def new
    @modification = Modification.new
  end

  # GET /modifications/1/edit
  def edit
  end

  # POST /modifications
  # POST /modifications.json
  def create
    @modification = Modification.new(modification_params)

    respond_to do |format|
      if @modification.save
        format.html { redirect_to @modification, notice: 'Modification was successfully created.' }
        format.json { render :show, status: :created, location: @modification }
      else
        format.html { render :new }
        format.json { render json: @modification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modifications/1
  # PATCH/PUT /modifications/1.json
  def update
    respond_to do |format|
      if @modification.update(modification_params)
        format.html { redirect_to @modification, notice: 'Modification was successfully updated.' }
        format.json { render :show, status: :ok, location: @modification }
      else
        format.html { render :edit }
        format.json { render json: @modification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modifications/1
  # DELETE /modifications/1.json
  def destroy
    @modification.destroy
    respond_to do |format|
      format.html { redirect_to modifications_url, notice: 'Modification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_modification
    @modification = Modification.find(params[:id])
  end

  def set_modifications
    @modifications = Modifications.where(vehicle_id: params[:vehicle_id])
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def modification_params
    params.require(:vehicle).permit(:user_id, :vehicle_id)
  end
end
