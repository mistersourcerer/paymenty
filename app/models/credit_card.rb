class CreditCard
  include ActiveModel::Model

  attr_accessor :number, :valid, :cvv
  validates :number, credit_card_number: true
  validate :future?

  private

  def valid_date?
    begin
      Date.parse(self.valid)
      true
    rescue Date::Error
      false
    end
  end

  def future?
    if valid_date?
      if Date.parse(self.valid) < Date.today
        errors.add(:valid, "#{self.valid} is not a future date")
      end
    else
      errors.add(:valid, "#{self.valid} is an invalid date")
    end
  end
end
