require 'rails_helper'

RSpec.describe CreditCard do
  let(:number) { "5555 5555 5555 4444" }

  context "date" do
    it "ensures date is a valid date" do
      card = CreditCard.new(
        number: number,
        valid: "123"
      )

      expect(card).to be_invalid
      expect(card.errors[:valid]).to_not be_empty
    end

    it "ensures date is in the future" do
      card = CreditCard.new(
        number: number,
        valid: Date.yesterday.strftime('%Y-%m-%d')
      )

      expect(card).to be_invalid
      expect(card.errors[:valid]).to_not be_empty
    end
  end
end
