class Api::WishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wish, only: %i[show update destroy]

  # GET /wishes
  def index
    @wishes = current_user.wishes.includes(:plant)
    mapped_wishes = map_to_res @wishes
    render json: mapped_wishes
  end

  # GET /wishes/1
  def show
    render json: @wish
  end

  # POST /wishes
  def create
    @wish = current_user.wishes.build(plant_id: params[:plant_id])

    if @wish.save
      render json: { product: @wish.plant, id: @wish.id, created_at: @wish.created_at }, status: :created
    else
      render json: @wish.errors, status: :unprocessable_entity
    end
  end

  # DELETE /wishes/1
  def destroy
    @wish.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wish
    @wish = Wish.find(params[:id])
  end

  def map_to_res(wishes)
    wishes.map do |wish|
      {
        product: wish.plant,
        id: wish[:id],
        created_at: wish[:created_at]
      }
    end
  end
end
