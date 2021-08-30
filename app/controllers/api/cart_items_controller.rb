class Api::CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: %i[show update destroy]

  # GET /cart_items
  def index
    @cart_items = current_user.cart_items.includes(:plant)
    mapped_cart_items = map_to_res @cart_items
    render json: mapped_cart_items
  end

  # GET /cart_items/1
  def show
    render json: @cart_item
  end

  # POST /cart_items
  def create
    @cart_item = current_user.cart_items.build(plant_id: params[:plant_id])
    if @cart_item.save
      render json: { product: @cart_item.plant, id: @cart_item.id, created_at: @cart_item.created_at }, status: :created
    else
      p '@cart_item.errors:: ', @cart_item.errors
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

  def map_to_res(cart_items)
    cart_items.map do |cart_item|
      {
        product: cart_item.plant,
        id: cart_item[:id],
        created_at: cart_item[:created_at]
      }
    end
  end
end
