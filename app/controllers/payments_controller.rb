class PaymentsController < ApplicationController
  def create
    credit_card = CreditCard.new(number: payment_params[:number])
    if credit_card.valid?
      # create payment
      @payment = OpenStruct.new(value: 4.2, created_at: Time.now.to_date.to_s, status: :created)
    else
      render json: {nope: false}, status: :unprocessable_entity
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:value, :number, :valid, :cvv)
  end
end
