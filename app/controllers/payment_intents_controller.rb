class PaymentIntentsController < ApplicationController
  def create
    Stripe.api_key = Rails.application.credentials.stripe[:api_secret_key]

    # Create a PaymentIntent with amount and currency
    payment_intent = Stripe::PaymentIntent.create(
      amount: 100 * calculate_order_amount(payment_intent_params),
      currency: 'ZAR'
    )
    render json: { clientSecret: payment_intent['client_secret'] }
  end

  private

  def payment_intent_params
    params.require(:payment_intent)
  end

  def calculate_order_amount(items)
    sum = 0
    items.each do |item|
      sum += item['quantity'] * item['price']
    end
    sum
  end
end
