class CreditCard
  include ActiveModel::Model

  attr_accessor :number
  validates :number, credit_card_number: true
end
