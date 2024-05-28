json.payment do
  json.extract! @payment, :value, :created_at, :status
end
