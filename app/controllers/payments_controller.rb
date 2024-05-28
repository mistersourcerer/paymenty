class PaymentsController < ApplicationController
  def create
    credit_card = CreditCard.new(card_params)
    @payment = Payment.new(payment_params)

    if credit_card.valid? && @payment.valid?
      slowify!
      @payment.accept!
    else
      render json: {
        errors: [
          {payment: @payment.errors},
          {card: credit_card.errors}
        ]
      }, status: :unprocessable_entity
    end
  end

  private

  def slowify!
    sleep(rand(0..4))
  end

  def new_payment_params
    params.require(:payment)
  end

  def card_params
    # params.permit(:number, :valid, :cvv)
    new_payment_params.permit(:number, :valid, :cvv)
  end

  def payment_params
    # params.permit(:value)
    new_payment_params.permit(:value)
  end
end
