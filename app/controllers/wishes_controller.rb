class WishesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_wish, only: [:show, :update, :destroy]

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
    @wish = Wish.new(wish_params)

    if @wish.save
      render json: @wish, status: :created, location: @wish
    else
      render json: @wish.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /wishes/1
  def update
    if @wish.update(wish_params)
      render json: @wish
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

    # Only allow a list of trusted parameters through.
    def wish_params
      params.require(:wish).permit(:user_id, :plant_id)
    end

    private

    def map_to_res(wishes)
      wishes.map do |wish|
        {
          product: wish.plant,
          id: wish[:id],
        }
      end
    end
  
end