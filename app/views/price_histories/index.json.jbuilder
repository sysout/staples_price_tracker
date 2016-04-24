json.array!(@price_histories) do |price_history|
  json.extract! price_history, :id, :product_id, :price
  json.url price_history_url(price_history, format: :json)
end
