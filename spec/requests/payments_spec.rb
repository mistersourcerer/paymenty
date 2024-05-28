require "swagger_helper"

RSpec.describe "Payments API", type: :request do
  path "/payments" do
    post "Creates a new payment" do
      consumes "application/json"
      produces "application/json"
      parameter name: :payment, in: :body, schema: {
        type: :object,
        properties: {
          payment: {
            type: :object,
            properties: {
              value: {type: :number},
              number: { type: :string },
              valid: { type: :string },
              cvv: {type: :integer},
            }
          }

        },
        required: ["value", "number", "valid", "cvv"]
      }

      response "200", "payment sucessfully created" do
        let(:payment) {
          {
            number: "5555 5555 5555 4444",
            valid: (Date.today + 1.year).to_s,
            cvv: 420,
            value: 13.60
          }
        }

        schema type: :object, properties: {
          payment: {
            type: :object,
            properties: {
              value: { type: :number },
              created_at: { type: :string },
              status: { type: :string }
            },
            required: [:value, :created_at, :status]
          }
        }, required: [:payment]

        run_test!
      end

      response "422", "invalid card" do
        let(:payment) {
          {
            number: "5555 5555 5555 4445",
            valid: (Date.today + 1.year).to_s,
            cvv: 420,
            value: 13.60
          }
        }

        run_test!
      end
    end
  end
end
