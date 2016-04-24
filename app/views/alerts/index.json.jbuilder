json.array!(@alerts) do |alert|
  json.extract! alert, :id, :user_id, :product_id, :desired
  json.url alert_url(alert, format: :json)
end
