class PaymentIntentsController < ApplicationController
  def create
    Stripe.api_key = ENV.fetch('STRIPE_API_SECRET_KEY', nil)

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
      prodct = item[:product]
      sum += item['quantity'] * prodct[:price]
    end
    sum + shipping_costs
  end

  def shipping_costs
    60
  end
end
