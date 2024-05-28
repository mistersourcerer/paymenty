json.payment do
  json.extract! @payment, :created_at, :status
  json.value @payment.value.floor(2).to_f
end
