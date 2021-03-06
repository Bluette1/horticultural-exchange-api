class Api::PlantsController < ApplicationController
  load_and_authorize_resource only: %i[update destroy create]
  before_action :set_plant, only: %i[show update destroy]

  # GET /plants
  def index
    @plants = Plant.all.order('created_at asc')

    render json: @plants
  end

  # GET /plants/1
  def show
    render json: @plant
  end

  # POST /plants
  def create
    @plant = Plant.new(plant_params)
    @plant.save

    if @plant.save
      render json: @plant.as_json(root: false), status: :created
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plants/1
  def update
    if @plant.update(plant_params)
      render json: @plant
    else
      render json: @plant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plants/1
  def destroy
    @plant.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_plant
    @plant = Plant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def plant_params
    params.require(:plant).permit(
      :name, :category, :price, :care, :image_url, :in_stock, :common_name, :description
    )
  end
end
