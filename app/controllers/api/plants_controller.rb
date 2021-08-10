class Api::PlantsController < ApplicationController
  load_and_authorize_resource only: [:update, :destroy, :create]
  before_action :set_plant, only: [:show, :update, :destroy]

  # GET /plants
  def index
    @plants = Plant.all

    render json: @plants
  end

  # GET /plants/1
  def show
    render json: @plant
  end

  # POST /plants
  def create
    image = params[:image]
    @plant = Plant.new(plant_params)
    @plant.image.attach(image) if image.present? && !!@plant

    if @plant.save
      render json: @plant.as_json(root: false, methods: :image_url), status: :created, location: @plant
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
      params.require(:plant).permit(:name, :category, :price, :care, :image)
    end
end
