class PaymentIntentsController < ApplicationController
  def create
    Stripe.api_key = Rails.application.credentials.stripe[:api_secret_key]

    # Create a PaymentIntent with amount and currency
    payment_intent = Stripe::PaymentIntent.create(
      amount: calculate_order_amount(payment_intent_params),
      currency: 'usd'
    )
    render json: { clientSecret: payment_intent['client_secret'] }
  end

  private

  def payment_intent_params
    params.require(:payment_intent)
  end

  def calculate_order_amount(_items)
    # Replace this constant with a calculation of the order's amount
    1400
  end
end
